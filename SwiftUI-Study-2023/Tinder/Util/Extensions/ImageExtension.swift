//
//  ImageExtension.swift
//  Tinder
//
//  Created by Hiroshi.Nakai on 2022/03/25.
//

import SwiftUI

extension Image {
    func asTopImage() -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: 30, height: 30, alignment: .center)
        
    }
}
