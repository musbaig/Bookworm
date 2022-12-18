//
//  AddBookView.swift
//  Bookworm
//
//  Created by Muslim Baig on 12/11/22.
//

import SwiftUI

extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    func isEmptyString() -> Bool {
        return self.trimmed() == ""
    }
}

let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = genres[0]
    @State private var review = ""
    
    var hasMissingBookInfo: Bool {
        if title.isEmptyString() || author.isEmptyString() || genre.isEmptyString() || review.isEmptyString() {
            return true
        }
        return false
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                }.disabled(hasMissingBookInfo)
            }
            .navigationTitle("Add a book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
