//
//  ClassView.swift
//  Landmarks
//
//  Created by Hiroshi.Nakai on 2023/07/06.
//

import SwiftUI

// クラスは参照型であり、値の変更が発生しても再描画のトリガーにはなりません。

class MyModel: ObservableObject {
    @Published var count = 0
    @Published var count2 = 0
    
    // 変数は変化するがViewに反映されない
    var count3 = 0 {
        didSet {
//            変更された後に自動的に呼び出されます。
            print("count3: \(count3)")
        }
    }
}

struct ClassView: View {
    
    @ObservedObject var modelc = MyModel()
    @State private var model = MyModel2()
    
    var body: some View {
        VStack{
            
            // 子Viewのパラメータは必須？
            StructChildView(count: $modelc.count, model: $model)
            Divider()
            ClassChildView(modelc: modelc)
            
            Text("P class Count 1: \(modelc.count)")
            Text("P class Count 2: \(modelc.count2)")
            Text("P class Count 3: \(modelc.count3)")
        }
    }
}

struct ClassChildView: View {
    
    // クラスを受けろ場合
    @ObservedObject var modelc: MyModel
    
    var body: some View {
        Text("class Count 1: \(modelc.count)")
        Text("class Count 2: \(modelc.count2)")
        Text("class Count 3: \(modelc.count3)")

        Button("class Increment 1 and 2") {
            modelc.count += 1
            modelc.count2 += 2
        }
        
        Button("class Increment 3") {
            modelc.count3 += 3
        }
        
        Button("reset") {
            modelc.count = 0
            modelc.count2 = 0
            modelc.count3 = 0
        }

        
    }
    
}


struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
    }
}
