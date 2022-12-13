//
//  RatingView.swift
//  Bookworm
//
//  Created by Adela Bonoiu on 12/12/22.
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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
