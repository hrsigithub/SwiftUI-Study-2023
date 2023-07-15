//
//  LazyVGridView.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/29.
//

import SwiftUI

struct LazyVGridView: View {

    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)

    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach (1..<21 ,id: \.self) { index in
                Text("Item \(index)")
                    .padding()
            }
        }
    }
}

struct LazyVGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridView()
    }
}
