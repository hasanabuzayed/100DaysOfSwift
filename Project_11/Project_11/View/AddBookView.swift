//
//  AddBookView.swift
//  Project_11
//
//  Created by Hasan Abuzayed on 11/22/21.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    private let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) { name in
                            Text(name)
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating, label: "Rating:")
                    
                    TextField("Write a review", text: $review)
                }
                
                Section {
                    Button("Save") {
                        saveBook()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    private func saveBook() {
        let newBook = Book(context: moc)
        newBook.title = title
        newBook.author = author
        newBook.rating = Int16(rating)
        newBook.genre = genre
        newBook.review = review
        
        try? self.moc.save()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
