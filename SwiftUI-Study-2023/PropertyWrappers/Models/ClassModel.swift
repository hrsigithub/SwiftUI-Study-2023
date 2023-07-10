//
//  ObservableObjectModel.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/10.
//
// クラスは参照型であり、値の変更が発生しても再描画のトリガーにはなりません。

import Foundation

class Model: ObservableObject {
    @Published var items: [SubModel] = []
    
    func addItems(_ items: [String]) {
        for item in items {
            self.items.append(SubModel(item))
        }
    }
}


class SubModel: ObservableObject, Identifiable {
    let id = UUID()
    @Published var isChecked = false
    @Published var name: String
    
    init(_ name: String) {
        self.name = name
    }
}


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
