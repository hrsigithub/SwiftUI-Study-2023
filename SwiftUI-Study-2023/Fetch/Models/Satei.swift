//
//  satei.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/23.
//

import Foundation




struct assessmentData: Codable, Hashable {
    
    let comHeader: comHeaderModel
    let mControl: [mControlModel]
    let datas: [assessmentModel]?
    
    init() {
        self.comHeader = comHeaderModel()
        self.mControl = []
        self.datas =  []
        
    }
}



struct mControlModel: Codable, Hashable, Identifiable {
    
    let id: Int
    let 業務ID: String
    let CD: Int
    let 名称: String
    
    //    init() {
    //        self.id = 0
    //        self.業務ID = ""
    //        self.CD = 0
    //        self.名称 = ""
    //    }
    
    public static func mockData() -> [mControlModel] {
        
        let datas = [
            mControlModel(id: 1, 業務ID: "RK", CD:1, 名称: "S"),
            mControlModel(id: 2, 業務ID: "RK", CD:1, 名称: "N"),
            mControlModel(id: 3, 業務ID: "RK", CD:1, 名称: "A"),
            
        ]
        
        //        let datas = [
        //             査定(id: 0, 伝票NO: 0, 受付NO: 202204071312, 計上日: DateUtils.getNowClockString(),
        //                行NO: 1, 店舗CD: 1001, 商品CD: 12345,
        //                数量: 2, 表示売価: 1000, 表示原価: 1002,  表示原価額: 2060, 割増額: 0, 成立フラグ: 1),
        //             査定(id: 1, 伝票NO: 0, 受付NO: 202204071312, 計上日: DateUtils.getNowClockString(),
        //                行NO: 2, 店舗CD: 1001, 商品CD: 12345,
        //                数量: 4, 表示売価: 1000, 表示原価: 1002,  表示原価額: 2060, 割増額: 0, 成立フラグ: 1),
        //         ]
        return datas
        
    }
}


struct comHeaderModel: Codable, Hashable {
    var 店舗CD: Int
    var 店舗名: String
    
    init() {
        self.店舗CD = 0
        self.店舗名 = ""
    }
}


struct assessmentModel: Codable, Hashable, Identifiable {
    
    var id: Int
    let 受付NO: Int
    var 商品名称漢字: String?
    var 仕入先CD: Int?
    var ランク区分: Int
    
    init() {
        self.id = 0
        self.受付NO = 0
        self.ランク区分 = 0
    }
}
