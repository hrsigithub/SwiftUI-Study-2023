//
//  SP500.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/17.
//

import SwiftUI

struct SP500View: View {
  var body: some View {
    VStack {
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      
    }
    .onAppear {
      print("SP500Viewを表示")
    }
    .onDisappear(perform: {
      print("SP500Viewを非表示")
    })
  }
  
}

#Preview {
  SP500View()
}
