//
//  FrameView.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/17.
//

import SwiftUI

struct FrameView: View {
    var body: some View {
        List {
            // 右寄せするには、frame必要
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .border(.red)

            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 100, alignment: .bottomTrailing)
                .border(.blue)

        }
    }
}

struct FrameView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView()
    }
}
