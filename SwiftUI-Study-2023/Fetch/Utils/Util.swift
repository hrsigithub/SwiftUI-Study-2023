//
//  Util.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/15.
//

import Foundation

func getURL(endpoint: String) throws -> URL {
    
    // 文字列から変換
    guard let url = URL(string: endpoint) else {
        throw GHError.invalidURL
    }
    
    return url
}


// 汎用 Fetch
func fetch<T: Decodable>(url:String, isKeyDecodingStrategy:Bool = false) async throws -> T {
    
    let url = try getURL(endpoint: url)
    
    let (data, res) = try await URLSession.shared.data(from: url)
    
    guard let res = res as? HTTPURLResponse, res.statusCode == HTTPURLResponse.ok else {
        throw GHError.invalidResponce
    }
    
    print(String(data: data, encoding: .utf8)!)
    
    do {
        let decoder = JSONDecoder()
        
        if isKeyDecodingStrategy {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
        }
        
        return try decoder.decode(T.self, from: data)
    } catch {
        print(error)
        throw GHError.invalidData
    }
}





