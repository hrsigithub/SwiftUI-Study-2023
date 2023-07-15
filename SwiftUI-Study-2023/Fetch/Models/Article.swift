//
//  Article.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/22.
//

import Foundation

// 参考
// https://mo-gu-mo-gu.com/ios-alamofire/

// Codable はJson <-> クラスの変換
// Hashable はForEachで必要。関連するモデル全て
// 入力コンポーネントの場合は、varでラベルのみはlet

struct Article: Codable, Hashable {
    let id: String
    var title: String
    let user: QittaUser

    // モデルにイニシャライザがいいのかも
    init() {
        self.id = ""
        self.title = ""
        self.user = QittaUser()
    }
}



