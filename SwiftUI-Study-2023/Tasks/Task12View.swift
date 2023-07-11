//
//  ContentView.swift
//  task12
//
//  Created by Hiroshi.Nakai on 2021/02/22.
//

import SwiftUI




struct Task12View: View {
    
    @ObservedObject var viewModel = Task12Model()
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer().frame(width: 10)
                Text("税抜金額")
                TextField("", text: $viewModel.textPrice)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
                Text("円")
                Spacer().frame(width: 10)
            }
            
            HStack {
                Spacer().frame(width: 10)
                Text("消費税率")
                TextField("", text: $viewModel.textTaxRate)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
                Text("％")
                Spacer().frame(width: 10)
            }
            
            HStack {
                Spacer().frame(width: 70)
                Button("計算") {
                    viewModel.calculate()
                }
                Spacer().frame(width: 30)
            }
            Divider()
            
            HStack {
                Spacer().frame(width: 70)
                Text("税込金額 \(String(viewModel.taxIncludePrice ?? 0)) 円")
                Spacer().frame(width: 10)
            }
            Spacer()
            
        }
        
    }
}

struct Task12View_Previews: PreviewProvider {
    static var previews: some View {
        Task12View()
    }
}
