//
//  AlertDialogView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/19.
//

import SwiftUI

struct AlertDialogView: View {
  @State private var isAlert = false
  @State private var isDialog = false
  
  var body: some View {
    VStack {
      Button("アラート") {
        isAlert = true
        
      }
      .padding()
      
      Button("ダイアログ") {
        isDialog = true
        
      }
      .padding()
      
    }
    .padding()
    .alert("マジで削除？", isPresented: $isAlert) {
      Button("削除する", role: .destructive) {
        
      }
      Button("チャラ", role: .cancel) {
      }
    } message: {
      Text("かますと元に戻せんよ")
    }
    .confirmationDialog("タイトル", isPresented: $isDialog, titleVisibility: .visible) {
      Button("選べ") {
      }
      Button("削除する", role: .destructive) {
        
      }
      Button("チャラ", role: .cancel) {
      }

    } message: {
      Text("かますときいくるうよ")
        .font(.largeTitle)
    }

    
  }
}

#Preview {
  AlertDialogView()
}
