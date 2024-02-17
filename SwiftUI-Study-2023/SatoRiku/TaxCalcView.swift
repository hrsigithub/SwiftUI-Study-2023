//
//  TaxCalcView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/16.
//

import SwiftUI

struct TaxCalcView: View {
    
    @State private var Input = ""
//    @State private var tax8 = 0.0
//    @State private var tax10 = 0.0
    
    var body: some View {
        VStack(spacing: 25)
        {
            // 中央よせ、数値のみ
            TextField("ここに金額カマス", text: $Input)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(TextAlignment.center)
            
            
//            Button("計算") {
////                tax8 = Double(Input)! * 0.08
////                tax10 = Double(Input)! * 0.1
//
//                tax8 = (Double(Input) ?? 0) * 0.08
//                tax10 = (Double(Input) ?? 0) * 0.1
//
//            }
            Text("価格:\(Input)")
            Text("消費税8%:\((Double(Input) ?? 0) * 0.08)")
            Text("消費税10%:\((Double(Input) ?? 0) * 0.1)")
        }
        //.padding()
        
    }
}

#Preview {
    TaxCalcView()
}
