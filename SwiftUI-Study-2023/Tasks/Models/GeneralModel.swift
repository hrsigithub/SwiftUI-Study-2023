//
//  GeneralModel.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/11.
//

import Foundation

struct AlertDetail: Identifiable {
    let id = UUID()
    let message: String
}

let prefectureNames =
[
    "北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県",
    "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県",
    "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県",
    "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県",
    "宮崎県", "鹿児島県", "沖縄県"
]



// Task12View
/// 責務: プレゼンテーションロジックとステート（状態）を持つ
/// ・ドメイン・エンティティをViewに表示できるように整形
/// ・ドメイン・ロジックが公開するメソッドを操作として公開
class Task12Model: ObservableObject {
    private let taxRateRepository = TaxRateRepository()
    
    @Published var textTaxRate: String {
        didSet {
            taxRateRepository.save(taxRate: Int(textTaxRate) ?? 0)
        }
    }
    
    init() {
        textTaxRate = String(taxRateRepository.load())
    }
    
    @Published var textPrice = ""
    @Published var taxIncludePrice: Int?
    
    func calculate() {
        taxIncludePrice = PriceCalculator().calculateTaxIncludePrice(
            price: Int(textPrice) ?? 0,
            taxRate: Int(textTaxRate) ?? 0
        )
    }
}

/// 責務: 税率の保存・読み込み
private class TaxRateRepository {
    private let keyTax = "tax"
    
    func load() -> Int {
        UserDefaults.standard.integer(forKey: keyTax)
    }
    
    func save(taxRate: Int) {
        UserDefaults.standard.set(taxRate, forKey: keyTax)
    }
}

/// 責務: 税込金額の計算
private class PriceCalculator {
    func calculateTaxIncludePrice(price: Int, taxRate: Int) -> Int {
        Int(Double(price) * (1.0 + Double(taxRate) / 100.0))
    }
}



// Task14View
struct Task: Identifiable {
    var id = UUID()
    var name: String
    var isDone: Bool
}

