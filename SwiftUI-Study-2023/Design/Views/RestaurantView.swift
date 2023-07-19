//
//  RestaurantView.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2020/10/12.
//

import SwiftUI

// ListView セルデザイン

struct RestaurantView: View {
    
    var title: String
    var type: String
    var note: String
    var rating = 2
    
    var body: some View {
        HStack() { // 行ね
            VStack() {
                HStack(spacing:0) {
                    ForEach(1...rating, id:\.self) { _ in
                        Image(systemName: "star.fill")

                    }
                    ForEach(rating..<5, id:\.self) { _ in
                        Image(systemName: "star")

                    }
                }.foregroundColor(.yellow)
                Text(type)
            }
            VStack() {
                Text(title).font(.largeTitle)
                Text(note).font(.subheadline)
                
            }
        }

    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(
            title: "jun",
            type: "タイプ",
            note: "ABC"
        ).previewLayout(.fixed(width:400, height:100))
    }
}
