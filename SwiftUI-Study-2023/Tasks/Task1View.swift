//
//  Task1View.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/09.
//

import SwiftUI

struct Task1View: View {
    @State private var textArray = Array(repeating: "", count: 5)
    
    @State private var result = ""
    
    var body: some View {
        HStack {
            VStack {
                VStack(spacing: 20.0) {
                    InputView(text: $textArray[0])
                    InputView(text: $textArray[1])
                    InputView(text: $textArray[2])
                    InputView(text: $textArray[3])
                    InputView(text: $textArray[4])
                    
                    Button("計算") {
                        // 計算
                        let num1 = Int(textArray[0]) ?? 0
                        let num2 = Int(textArray[1]) ?? 0
                        let num3 = Int(textArray[2]) ?? 0
                        let num4 = Int(textArray[3]) ?? 0
                        let num5 = Int(textArray[4]) ?? 0
                        
                        let total = num1 + num2 + num3 + num4 + num5
                        result = String(total)
                        
                        UIApplication.shared.closeKeyboard()
                    }.padding()
                    
                    HStack {
                        Text(result)
                    }
                    .frame(width: 150, height: 30, alignment: .leading)
                    Spacer()
                }
            }
            Spacer()
        }
        .padding(.leading, 20.0)
    }
}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct Task1View_Previews: PreviewProvider {
    static var previews: some View {
        Task1View()
    }
}
