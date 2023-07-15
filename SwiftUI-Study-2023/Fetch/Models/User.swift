//
//  User.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/15.
//

import Foundation



struct User: Codable, Hashable  {
    let id: String
    let permanent_id: Int
    let profile_image_url: String

    var name: String
    var password: String
    
    // Memberwise Initializerがあるため不要だが、インスタンス時に初期化が必須

    init() {
        self.id = ""
        self.permanent_id = 0
        self.profile_image_url = ""
        self.name = ""
        
        self.password = ""
        
    }
}


