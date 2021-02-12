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
    
    let book: Book
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
                Spacer()
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"))
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
