//
//  HierarchicalStructure.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/10.
//

// ObservableObjectを階層構造で使う


// Viewが再描画されない理由

//項目のタップによってSubModelクラスの値は変更されますが、上位のModelクラスには変更が発生しません。
//クラス配列の場合、要素の追加/削除・順序入れ替えなどが発生した場合の変更は感知しますが、要素クラスの中身の変更は感知できません。
//この為、View側もモデルの変更を感知できず、再描画が発生しないのです。


import SwiftUI

struct HierarchicalStructure: View {
    
    @ObservedObject private var model = Model()
    
    var body: some View {
        VStack {
            Button("アイテム追加") {
                model.addItems(["りんご", "ばなな", "みかん"])
            }
            
            // こっちの方が理想
            List {
                ForEach(model.items) { item in
                    SubView(item: item)
                }
            }

            // こっちはSingle Source of Truth に則していない
            List {
                ForEach(model.items) { item in
                    HStack {
                        Image(systemName: item.isChecked ? "checkmark.rectangle" : "rectangle")
                        Text(item.name)
                        Spacer()
                    }
                    // tapGestureイベントが発生して値は変わっているのですが、Viewは再描画されない
                    .onTapGesture {
                        item.isChecked.toggle()
                        model.objectWillChange.send()   // 強制再描画
                    }
                }
            }
        }
    }
    
    
}


struct SubView: View {
    @ObservedObject var item: SubModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isChecked ? "checkmark.rectangle" : "rectangle")
            Text(item.name)
            Spacer()
        }
        .onTapGesture {
            item.isChecked.toggle()
        }
    }
}


struct HierarchicalStructure_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalStructure()
    }
}
