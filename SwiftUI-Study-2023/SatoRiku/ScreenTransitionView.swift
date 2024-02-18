//
//  ScreenTransitionView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/18.
//

import SwiftUI

// 画面遷移

struct ScreenTransitionView: View {
  @State private var isShow = false
  
  
  var body: some View {
    NavigationStack {
      VStack(spacing: 15){
        
        NavigationLink {
          SecondView()
        } label: {
          Text("ナビゲーション遷移")
        }.background(Color.red)
        
        NavigationLink {
          SecondView()
        } label: {
          Text("ナビゲーション遷移")
        }.background(Color.yellow)
        
        
        
        Button("モーダル遷移") {
          isShow = true
        }
        
        // fullScreenCover は元の画面に戻れない
        .sheet(isPresented: $isShow, content: {
          // .fullScreenCover(isPresented: $isShow, content: {
          SecondView()
          // .presentationDetents([.height(30)])
            .presentationDetents([.medium])
        })
        
        
      }
      .padding()
      .navigationTitle("画面遷移テストだべ")
    }
  }
}


struct SecondView: View {
  var body: some View {
    ZStack {
      Color.green
    }
    .padding()
  }
  
}



#Preview {
  ScreenTransitionView()
}
