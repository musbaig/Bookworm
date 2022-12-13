//
//  RatingView.swift
//  Bookworm
//
//  Created by Muslim Baig on 12/12/22.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var onImage = Image(systemName: "star.fill")
    var offImage: Image?
    
    var onColor = Color.yellow
    var offColor = Color.gray
    
    func image(for number: Int) -> Image {
        return number > rating ? offImage ?? onImage : onImage
    }
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
