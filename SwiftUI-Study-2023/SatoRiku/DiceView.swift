//
//  DiceView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/17.
//

// 学んだ技術
// 整数の乱数の発生方法
// Timer処理
// 2重ボタン押下制御


import SwiftUI

struct DiceView: View {
  
  @State private var randomNumber = 1
  @State private var timer:Timer?
  @State private var isRolling = false
  
  // UIと分離
  func playdice() {
    print("ボタン押下!!")
    isRolling = true

    // 0.1sec毎に処理する
    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
      // 1から6の乱数
      randomNumber = Int.random(in: 1...6)
      print("\(randomNumber)!!!")
    }
    
    // 0.5 sec後の処理
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      timer?.invalidate()
      timer = nil
      isRolling = false

      print("\(randomNumber)でよった")
    }
    

  }
  
  
  var body: some View {
    VStack {
      
      Spacer()
      
      Image(systemName: "die.face.\(randomNumber)")
        .resizable()
        .scaledToFit()
        .frame(width: UIScreen.main.bounds.width / 2)
        .padding()
      
      Spacer()
      
      Button(action: {
        playdice()
      },label: {
        Text("サイコロカマス")
          .padding()
          .background(Color.orange)
          .foregroundColor(.black)
          .cornerRadius(10)
      })
      .disabled(isRolling)
      
      Spacer()
      
      
    }.padding()
    
  }
  
}

#Preview {
  DiceView()
}
