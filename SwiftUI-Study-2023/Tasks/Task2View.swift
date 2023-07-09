//
//  Kadai002View.swift
//  TaskChallenge
//
//  Created by Hiroshi.Nakai on 2021/02/12.
//

import SwiftUI

struct Task2View: View {
    @State private var textArray = Array(repeating: "", count: 2)
    
    @State private var selection = 0
    @State private var result = ""
    
    var body: some View {
        VStack {
            VStack(spacing: 20.0) {
                InputView(text: $textArray[0])
                InputView(text: $textArray[1])
                
                Picker(selection: $selection, label: Text("")) {
                    Text("＋").tag(0)
                    Text("ー").tag(1)
                    Text("✕").tag(2)
                    Text("÷").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Button("計算") {
                    // 計算
                    let num1 = Int(textArray[0]) ?? 0
                    let num2 = Int(textArray[1]) ?? 0
                    
                    switch selection {
                    case 0:
                        result = String(num1 + num2)
                    case 1:
                        result = String(num1 - num2)
                    case 2:
                        result = String(num1 * num2)
                    case 3:
                        if num2 == 0 {
                            result = "0で割ることはできません。"
                        } else {
                            result = String(num1 / num2)
                        }
                    default:
                        result = ""
                    }
                    UIApplication.shared.closeKeyboard()
                }.padding()
                
                HStack {
                    Text(result)
                }
            }
            Spacer()
        }
    }
}

struct Task2View_Previews: PreviewProvider {
    static var previews: some View {
        Task2View()
    }
}
