//
//  TodoListView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/22.
//

import SwiftUI

struct TodoListView2: View {
  
  // control+shift+下 マルチカーソル
  // command+shift+右で選択
  // shift+左
  // (入力
  // 左キー
  // title:
  // command+右, 左キー
  
  // リロード　command+option+p
  // エミュレータキーボード   command+shift+K
  // エミュレータ ダークモード   command+shift+a
  
  @State private var taskDatas = [(title: "ジョギングかます", completed: false),
                                  (title: "部屋掃除", completed: false),
                                  (title: "本読む", completed: false),
                                  (title: "花に水実施", completed: false)]
  
  
  
  
  var body: some View {
    NavigationStack {
      List(0..<taskDatas.count, id: \.self) { index in
        Button {
          taskDatas[index].completed.toggle()
        } label: {
          HStack {
            Image(systemName: taskDatas[index].completed ? "checkmark.circle.fill" : "circle")
            Text(taskDatas[index].title)
          }
        }
        // ダークモード対応
//        .foregroundColor(.black)
        .foregroundColor(.primary)

      }
      .navigationTitle("TodoList")
      
    }
  }
}

#Preview {
  TodoListView2()
}
