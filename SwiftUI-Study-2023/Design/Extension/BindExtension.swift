//
//  BindExtension.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/23.
//

import Foundation
import SwiftUI


extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}



//extension Binding where Value == Int {
//    func IntToStrDef(_ def: Int) -> Binding<String> {
//        return Binding<String>(get: {
//            return String(self.wrappedValue)
//        }) { value in
//            self.wrappedValue = Int(value) ?? def
//        }
//    }
//}

