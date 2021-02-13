//
//  ContentView.swift
//  BookwormCD
//
//  Created by Travis Brigman on 2/12/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Book.title, ascending: true)]) var books: FetchedResults<Book>
    
    @State private var showingAddscreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.self) {
                    book in
                    NavigationLink(destination: DetailView(book: book)) {
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
                .onDelete(perform: deleteBooks)
            }
            .navigationBarTitle("Bookworm 🐛")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: { self.showingAddscreen.toggle()
                
            }) {
                Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $showingAddscreen) {
                    AddBookView().environment(\.managedObjectContext, self.moc)
            }
        }
    }
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
