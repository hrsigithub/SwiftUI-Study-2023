//
//  InputView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/10.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
        //            .keyboardType(.decimalPad)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black.opacity(0.5), lineWidth: 1)
            )
    }
}



struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        
        @State  var dummy = "dummy"
        InputView(text:$dummy)
    }
}
