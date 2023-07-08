//
//  StateView.swift
//  Landmarks
//
//  Created by Hiroshi.Nakai on 2023/07/06.
//

import SwiftUI

// 構造体にObservableObjectプロトコルはコンパイルエラー

struct MyModel2 {
    var count = 0
}

struct StructView: View {
    
    // 構造体のみ
    // @State 説明
    // privateつける
    @State private var count = 0
    @State private var model = MyModel2()
    
    var body: some View {
        StructChildView(count: $count, model: $model)
        
    }
}

struct StructChildView: View {
    
    
    // @Binding説明
    // 複数のビュー間で状態を共有するために使用されます。
    // 外部で定義された状態をビュー内にバインドするために使用されます。
    // 変更が検出された場合にビューを再描画せず、変更が外部の状態に伝播されます。
    // 通常、親ビューから子ビューにデータを渡すために使用されます。
    
    @Binding var count: Int
    @Binding var model: MyModel2
    
    var body: some View {
        VStack {
            Text("Count: \(count)")
            Text("Model Count: \(model.count)")
            Divider()
            Button("Increment") {
                count += 1
            }
            Button("Increment　構造体") {
                model.count += 1
            }
            
        }
    }
}



struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StructView()
    }
}
