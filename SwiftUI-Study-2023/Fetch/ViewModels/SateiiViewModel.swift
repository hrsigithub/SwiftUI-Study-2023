//
//  sateiiViewModel.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/23.
//

import Foundation

class SateiViewModel : ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    @Published var comHeaderData = comHeaderModel()
    //    @Published var datas: sateiData = sateiData()
    @Published var sateidatas: [assessmentModel] = [assessmentModel]()
    var sydDatas : [mControlModel] = [mControlModel]()
    var ranks: [mControlModel] = []
    
    
    //    var ranks = systemControl.mockData()
    
    
    func get() {
        isLoading = true
        errorMessage = nil
        
        
//        let url1 = "http://127.0.0.1:8000/purchase/get_first_assessment_data_ipad"
//        let url2 = "http://127.0.0.1:8000/purchase/get_first_assessment_data_ipad?no=66"
        
        // 同期通信
        //        AsAf.shared.fetchAsync(url: url1, type: assessmentData.self) { datas in
        //            print("AsAf:1")
        //
        //            print("data:1:\(datas)")
        //            DispatchQueue.main.async {
        //                print("data:2:\(datas)")
        //
        //                self.comHeaderData = datas.comHeader
        //                self.sydDatas = datas.mControl
        //
        //                if let sateis = datas.datas {
        //                    // not nil
        //                    self.sateidatas = sateis
        //                } else {
        //                    self.sateidatas = [assessmentModel]()
        //                }
        //
        //
        //
        //                self.ranks = self.sydDatas.filter { data in
        //                    data.業務ID == "RK"
        //                }
        //
        //
        //                print("comHeaderData:\(self.comHeaderData)")
        //                print("コントロールマスタ:\(self.sydDatas)")
        //                print("ranks:\(self.ranks)")
        //                print("査定データ:\(self.sateidatas)")
        //
        //                self.isLoading = false
        //                print("AsAf:2")
        //
        //            }
        print("AsAf:3")
        
        
    }
}

