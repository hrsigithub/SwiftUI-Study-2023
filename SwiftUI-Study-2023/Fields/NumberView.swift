//
//  NumberView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/13.
//

import SwiftUI

struct NumberView: View {
    
    @State private var value: Int = 100
    @State private var zero: Int? = nil

    var Zero: String {
        get {
            if let target = self.zero {
                return String(target)
            }
            // nil
            print("nil return")
            return "A"
        }
        set {
            print("set ")
            self.zero = Int(newValue)
        }
    }

    
    var body: some View {
        
        VStack {
            Text("金額").font(.largeTitle)
            TextField(
                "金額",
                value: $value,
                formatter: numberFormatter, // via Util
                onCommit: { print("commit") /* return を押すと onCommit が呼ばれる */ }
            )
            
            Text("Value: \(value.description)")
            Text("Value: \(value)")
            
            
            Divider()

            Text("Zero").font(.largeTitle)
            TextField(
                "target",
                value: $zero,
                formatter: NumberFormatter()
            )
            Text("value:\(Zero)")

            

        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView()
    }
}
