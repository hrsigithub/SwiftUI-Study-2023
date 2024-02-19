//
//  SP500.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/17.
//

import SwiftUI
import Alamofire
import SwiftSoup

struct SP500View: View {
  var body: some View {
    VStack {
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      
    }
    .onAppear {
      print("SP500Viewを表示")
      
      let url = "https://itf.minkabu.jp/fund/03311187"

//      AF.request(url).responseString { response in
//        switch response.result {
//        case .success(let html):
//          print(html)
//        case .failure(let error):
//          print(error)
//        }
//      }
      
      AF.request(url).responseString { response in
        if let html = response.value, let doc = try? SwiftSoup.parse(html) {
          let price = try? doc.getElementsByClass("stock_price").first()?.text()
          let fl = try? doc.getElementsByClass("fund_cv clearfix fd_box").first()?.text()
          let fd = try? doc.getElementsByClass("fd_estimate clearfix").first()?.text()

          print(price ?? 0)
          print(fl ?? 0)
          print(fd ?? 0)
        }
//                    if let titleElement = try? doc.select("title").first(), let title = try? titleElement.text() {
//                      print(title)
//                    }

      }
      
      
      
    }
    .onDisappear(perform: {
      print("SP500Viewを非表示")
    })
  }
  
}

#Preview {
  SP500View()
}
