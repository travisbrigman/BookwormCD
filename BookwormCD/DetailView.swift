//
//  DetailView.swift
//  BookwormCD
//
//  Created by Travis Brigman on 2/12/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    let book: Book
    
    var formattedAddDate: String {
        
        if let dateAdded = self.book.date {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: dateAdded)
        } else {
            return "N/A"
        }
    }
    

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size.width)
                    
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                    .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                    .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                Text(self.book.author ?? "Unkwown Author")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text(self.book.review ?? "No Review")
                .padding()
                
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                
                Text("Date Added: \(self.formattedAddDate)")
                    .padding()
                Spacer()
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"))
        .alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("Delete Book"), message: Text("Are you Sure?"), primaryButton: .destructive(Text("Delete")){
                self.deleteBook()
                }, secondaryButton: .cancel())
        }
        .navigationBarItems(trailing: Button(action: { self.showingDeleteAlert = true
            
        }){
            Image(systemName: "trash")
        })
    }
    func deleteBook() {
        moc.delete(book)
//        try? self.moc.save()k
        presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test Book"
        book.author = "Test Author"
        book.genre = "fantasy"
        book.rating = 4
        book.review = "What a good read!"
        return NavigationView {
            DetailView(book: book)
        }
    }
}
