//
//  BookView.swift
//  Project_11
//
//  Created by Hasan Abuzayed on 11/23/21.
//

import SwiftUI

struct BookView: View {
    let book: Book
    
    var body: some View {
        HStack {
            EmojiRatingView(rating: book.rating)
                .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text(book.title ?? "Unknown Title")
                    .font(.headline)
                Text(book.author ?? "Unknown Author")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: Book())
    }
}
