//
//  Utis.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/13.
//

import Foundation


let numberFormatter: NumberFormatter = {
    let f = NumberFormatter()
    f.locale = Locale(identifier: "ja_JP")
    f.numberStyle = .decimal
    f.groupingSeparator = "," // 区切り文字を指定
    f.groupingSize = 3 // 何桁ごとに区切り文字を入れるか指定
    
    //        f.numberStyle = .currencyPlural
    //        f.isLenient = true
    return f
}()
