//
//  BooksView.swift
//  Project_11
//
//  Created by Hasan Abuzayed on 11/22/21.
//

import SwiftUI

struct BooksView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var showingAddBook = false
    
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ], animation: .default)
    private var books: FetchedResults<Book>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        BookView(book: book)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        showingAddBook.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddBook) {
                AddBookView()
                    .environment(\.managedObjectContext, moc)
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { books[$0] }.forEach(moc.delete)
            
            do {
                try moc.save()
            } catch {
                print("Some went wrong, ops!")
            }
        }
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
