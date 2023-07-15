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
