//
//  GitHubUser.swift
//  Landmarks
//
//  Created by Hiroshi.Nakai on 2023/07/07.
//

import Foundation

// public typealias Codable = Decodable & Encodable
// JSON 変換　読み取りだけなら、Decodable
struct GitHubUser:Decodable {
    // 変数名はJSONと一致させる必要ある。
    // 全て定義しなくてOK（画面表示する分だけ）
    
    let login1: String
    let id:Int
    
    // 以下はSnakeケース(snake_case)で、Swiftではダメ
    //    let avatar_url:String
    
    // キャメルケース(camelCase)が慣例
    let avatarUrl:String
    
    let bio:String?
    
    // JSONと一致しない場合は、CodingKey
    // 全て定義する必要あり。異なる場合のみ=JloginSONの名前
    // convertFromSnakeCaseを使用 しても良い
    enum CodingKeys: String, CodingKey {
        case login1 = "login" // JSON →login
        case id
        case avatarUrl    // わざと、JSON形式に一致させない
        case bio
    }
}
