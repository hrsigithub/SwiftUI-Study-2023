//
//  BottomButtonModifier.swift
//  Tinder
//
//  Created by Hiroshi.Nakai on 2022/03/25.
//

import SwiftUI

// よく使うモディファイ定義
struct BottomButtonModifier: ViewModifier {
    
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
            .cornerRadius(size)
            .shadow(radius: 10)
        
    }
}
