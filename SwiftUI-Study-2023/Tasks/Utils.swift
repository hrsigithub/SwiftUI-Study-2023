//
//  Utils.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/10.
//

import Foundation
import SwiftUI

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
