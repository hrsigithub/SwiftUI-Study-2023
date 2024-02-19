//
//  CounterView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/19.
//

import SwiftUI

struct CounterView: View {
  
  @State private var count = 0
  @State private var isShow = false
  
  var body: some View {
    
    // デバッグ用　print
    let _ = Self._printChanges()
    
    VStack {
      HStack {
        Button("-") {
          count -= 1
          //print("再描画すんで")
        }
        
        Text("Counter:\(count)")
        
        Button("+") {
          count += 1
        }
        
      }
      .padding()
      Button("遷移") {
        isShow = true
      }
      
      
    }
    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    .sheet(isPresented: $isShow, content: {
      
      // $は参照渡し
      CounterView2(cnt: $count, isClose: $isShow)
        .presentationDetents([.medium])
        .onDisappear(perform: {
          print("画面閉じられたで")
        })
    })
  }
}


struct CounterView2: View {
  
  // @Bindingは初期化不可なので、型必須
  @Binding var cnt: Int
  @Binding var isClose: Bool

  var body: some View {
    // デバッグ用　print
    let _ = Self._printChanges()


    VStack {
      Button("+10") {
        cnt += 10
        
        //画面自動で閉じる
        isClose = false
      }
      .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

      Button("やめ") {
        
        //画面自動で閉じる
        isClose = false
      }
      .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

    }


  }
}



#Preview {
  CounterView()
}
