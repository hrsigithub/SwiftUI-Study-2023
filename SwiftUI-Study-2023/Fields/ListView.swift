//
//  ListView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/13.
//

import SwiftUI

struct ListView: View {
    
    @State private var animals: [String] = ["🐶", "🐱"]
    @State private var items: [String] = ["Item 1", "Item 2", "Item 3"]
    
    private func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        VStack {
//            NavigationView の中に List を配置し、List の中に ForEach を使用して要素を反復処理することで、ナビゲーションビューとリストの組み合わせを作成できます。
            
            NavigationView {
                
                List {
                    
                    ForEach($animals, id: \.self) { $animal in
                        TextField("name ?", text: $animal)
                    }
                    .onDelete { indexSet in
                        self.animals.remove(atOffsets: indexSet)
                    }
                }
                .navigationTitle("Animals")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }

            }
            
            Spacer()
            
            NavigationView {
                List {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                    .onDelete(perform: deleteItem)
                }
                .navigationTitle("Items")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }
            }
            
            Spacer()
            
            List(0..<3) {(row: Int) in
                Text("Row \(row)")
                    .listRowBackground(Color.yellow)
            }
            
            
            Spacer()
            
            List {
                ForEach(0..<3) {(row: Int) in
                    Text("Row \(row)")
                        .listRowBackground(Color.blue)
                }
            }
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
