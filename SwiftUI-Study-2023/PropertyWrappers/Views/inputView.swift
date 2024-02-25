//
//  inputView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/25.
//

import SwiftUI

// クラスはObservableObjectプロトコルに準拠して定義
class inputViewModel: ObservableObject {
// 変更を監視したいプロパティに@Publishedを付与
  @Published  var title: String = ""
}

// @StateObjectと@ObservedObjectとの違いと使い分け

// @ObservedObjectはそのオブジェクトを含むView構造体が再描画された際にインスタンスが破棄され、再度新規でインスタンス化されます。

// @StateObjectはそのオブジェクトを含むView構造体が再描画されてもインスタンスは破棄されず、同じインスタンスを保持してくれます。

struct inputView: View {
  @State  private var count: Int = 0
  
  var body: some View {
    VStack {
      Text("\(count)")
      
      Button {
        count += 1
      } label: {
        Text("Add Count")
      }
      
      ObservedObjectInputView()
      StateObjectInputView()
    }
  }
}

struct ObservedObjectInputView: View {
  // viewModelが再構築される
  @ObservedObject  private var viewModel = inputViewModel()
  
  var body: some View {
    VStack {
      // 再描画すると消える！なぜこんな仕組みがある？
      TextField("タイトル", text: $viewModel.title)
      Text("\(viewModel.title)")
    }    }
}


struct StateObjectInputView: View {
  @StateObject  private var viewModel = inputViewModel()
  
  var body: some View {
    VStack {
      TextField("タイトル", text: $viewModel.title)
      Text("\(viewModel.title)")
    }    }
}



#Preview {
  inputView()
}
