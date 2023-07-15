//
//  TableView.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/04.
//

import SwiftUI

struct Person: Identifiable {
    let givenName: String
    let familyName: String
    let id = UUID()
}

//private var people = [
//    Person(givenName: "Juan", familyName: "Chavez"),
//    Person(givenName: "Mei", familyName: "Chen"),
//    Person(givenName: "Tom", familyName: "Clark"),
//    Person(givenName: "Gita", familyName: "Kumar"),
//]

struct TableView: View {
    
    var body: some View {
        ZStack {
            HStack {
                List {
                    Section(header: Text("Column A")) {
                        ExampleRow()
                        ExampleRow()
                        ExampleRow()
                    }
                }
                .listStyle(GroupedListStyle())
                    .disabled(true)
                
                List {
                    Section(header: Text("Column B")) {
                        ExampleRow()
                        ExampleRow()
                        ExampleRow()
                    }
                }
                .listStyle(GroupedListStyle())
                    .disabled(true)
                
                List {
                    Section(header: Text("Column C")) {
                        ExampleRow()
                        ExampleRow()
                        ExampleRow()
                    }
                }
                .listStyle(GroupedListStyle())
                    .disabled(true)

            }
            Rectangle().fill(Color.gray).opacity(0.4).frame(width: CGFloat(1))
        }
        
    }
    
}

struct ExampleRow: View {
    var body: some View {
        Text("Example Row")
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
