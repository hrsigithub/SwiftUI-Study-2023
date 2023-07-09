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


// Unit test
func getUser2() ->GitHubUser? {
        return nil
}


func getUser(userId: String) async throws -> GitHubUser {
    //        let endpoint = "https://api.github.com/users/hrsigithub"
    let endpoint = "https://api.github.com/users/\(userId)"
    
    
    // 文字列から変換
    guard let url = URL(string: endpoint) else {
        throw GHError.invalidURL
    }
    
    // -> (Data, URLResponse)を返却
    let (data, res) = try await URLSession.shared.data(from: url)
    
    // resをHTTPURLResponse型にダウンキャスト
    // swiftでがレスポンスコードの定数がない？
    
    guard let res = res as? HTTPURLResponse, res.statusCode == HTTPURLResponse.ok else {
        throw GHError.invalidResponce
    }
    
    // 以下、ループ処理ではない
    do {
        let decoder = JSONDecoder()
        // スネークケースに変換
        //　convertFromSnakeCaseは特定の変数にできない。
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(GitHubUser.self, from: data)
    } catch  {
        print(error)
        throw GHError.invalidData
    }
}




