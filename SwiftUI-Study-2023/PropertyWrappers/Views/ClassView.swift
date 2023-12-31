//
//  ClassView.swift
//  Landmarks
//
//  Created by Hiroshi.Nakai on 2023/07/06.
//

import SwiftUI

struct ClassView: View {
    
    @ObservedObject var modelc = MyModel()
    @State private var model = StructModel()
    
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
    // それぞれのビューは別々のインスタンスを保持している
    @ObservedObject var modelc: MyModel
    
    var body: some View {
        Text("class Count 1: \(modelc.count)")
        Text("class Count 2: \(modelc.count2)")
        Text("class Count 3: \(modelc.count3)")

        // それぞれのビューはviewModelとChildViewのカウントは独立して管理されます。
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
