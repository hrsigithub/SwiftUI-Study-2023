//
//  TextFieldView.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/05/01.
//

import SwiftUI

struct TextFieldView: View {

    @State private var strValue:String = ""
    @State private var intValue:Int = 0

    var intFormatter: Formatter = NumberFormatter()

    var body: some View {

        VStack {
            Group {
                TextField("input String", text: $strValue)
                Text("input value : \(strValue)")
            }
            .padding()

            Group {
                TextField("input Int", value: $intValue, formatter: intFormatter)
                Text("Int value: \(intValue)")
            }
            .padding()
        }
        .padding()

    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
