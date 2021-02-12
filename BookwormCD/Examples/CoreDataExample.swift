//
//  CoreDataExample.swift
//  BookwormCD
//
//  Created by Travis Brigman on 2/12/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI
//This example relies on a Student entity being creat first in the .xcdatamodel file

/*
struct CoreDataExample: View {

    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name ?? "Unknown")
                }
            }
            Button("add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Potter", "Lovegood", "Weasley"]
                //We're force unwrapping these because we made the data source above and know they will always have a value
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                //this is a throwing function, but since we know that all the data is there, it wont fail, so we wont catch errors
                try? self.moc.save()
            }
        }
    }
}

struct CoreDataExample_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataExample()
    }
}
*/
