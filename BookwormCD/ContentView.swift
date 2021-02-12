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
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddscreen = false
    
    var body: some View {
        NavigationView {
            Text("Count: \(books.count)")
                .navigationBarTitle("Bookworm 🐛")
                .navigationBarItems(trailing: Button(action: { self.showingAddscreen.toggle()
                    
                }) {
                    Image(systemName: "plus")
                    }
            )
                .sheet(isPresented: $showingAddscreen) {
                    AddBookView().environment(\.managedObjectContext, self.moc)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
