//
//  TopView.swift
//  Tinder
//
//  Created by Hiroshi.Nakai on 2022/03/25.
//

import SwiftUI

struct TopView: View {
    
    enum SelectedItem {
        case tinder, good, comment, profile
    }
    
    @State var selectedItem: SelectedItem = .good
    
    private var frameWidth: CGFloat{
        UIScreen.main.bounds.width
    }
    
    var body: some View {
        HStack {
            
            Button(action: {
                selectedItem = .tinder
            }, label: {
                Image(systemName: "flame.fill")
                    .asTopImage()
                    .foregroundColor(selectedItem == .tinder ? .red : .gray)
            })
            .frame(width: frameWidth / 4 - 20)
            .padding(.leading, 30)
            Button(action: {
                selectedItem = .good
            }, label: {
                Image(systemName: "suit.diamond.fill")
                    .asTopImage()
                    .foregroundColor(selectedItem == .good ? .red : .gray)
                
            })
            .frame(width: frameWidth / 4 - 20)
            
            Button(action: {
                selectedItem = .comment
            }, label: {
                Image(systemName: "bubble.left.fill")
                    .asTopImage()
                    .foregroundColor(selectedItem == .comment ? .orange : .gray)
            })
            .frame(width: frameWidth / 4 - 20)
            
            Button(action: {
                selectedItem = .profile
            }, label: {
                Image(systemName: "person.circle")
                    .asTopImage()
                    .foregroundColor(selectedItem == .profile ? .pink : .gray)
            })
            .frame(width: frameWidth / 4 - 20)
            .padding(.trailing, 30)
            
            
        }
        .padding()
        .frame(width: frameWidth)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
