//
//  DetailView.swift
//  Project_11
//
//  Created by Hasan Abuzayed on 11/23/21.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var pop
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .frame(width: geo.size.width)
                
                Text(book.genre ?? "Genre")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
                }
                
                Text(book.author ?? "N/A")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text(book.review ?? "no review!")
                    .padding()
                
                RatingView(rating: .constant(Int(book.rating)))
                    .font(.largeTitle)
                
                Spacer()
                
                Button("Delete Book", role: .destructive) {
                    showingDeleteAlert = true
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle(book.title ?? "BookyBo")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete!", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive) {
                moc.delete(book)
                do {
                    try moc.save()
                    pop()
                } catch {
                    print("Some went wrong, ops!")
                }
            }
            
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure you want to delete this book?")
        }

    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Booky bo"
        book.author = "Author-o"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
