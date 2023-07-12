//
//  ViewExtension.swift
//  Tinder
//
//  Created by Hiroshi.Nakai on 2022/03/25.
//

import SwiftUI

// View から直接アクセス可能

extension View {
    func asRoundShadow(size: CGFloat) -> some View {
        modifier(BottomButtonModifier(size: size))
    }
}

