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
      
//      let url = "https://itf.minkabu.jp/fund/03311187"
      let url = "https://itf.minkabu.jp/fund/9I31223A"
      
      AF.request(url).responseString { response in
        switch response.result {
        case .success(let html):
          //print(html)
          
          do {
            let doc = try SwiftSoup.parse(html)
            //print(doc)
            //            let entries = try doc.select("div.fund_cv clearfix fd_box")
            //            print(entries)
            let entries = try? doc.getElementsByClass("fund_cv clearfix fd_box")
            let date = try? entries?.select("span").first()?.text()
            print("DATE:\(date ?? "")")

            let stock = try? entries?.select("div.stock_price").first()?.text()
            print("stock:\(stock ?? "")")

            let stock2 = try? entries?.select("span").last()?.text()
            print("stock2:\(stock2 ?? "")")

            // 正規表現パターン
            let pattern = "\\((\\+|\\-)?\\d+\\.\\d+%\\)"
            
            // 正規表現によるマッチング
            if let range = stock2?.range(of: pattern, options: .regularExpression) {
              let matchedString = stock2?[range]
              print(matchedString ?? "")  // 出力: (+0.45%)
            } else {
              print("No match found")
            }
            
            // 正規表現パターン
            let pattern2 = "\\d+"
            
            // 正規表現によるマッチング
            if let range = stock2?.range(of: pattern2, options: .regularExpression) {
              let matchedString = stock2?[range]
              print(matchedString ?? "") // 出力: 56
            } else {
              print("No match found")
            }
            
            
            
            //let date = try entries[safe: 0]?.select("div.date").text()
            
            
            //print(fl ?? "")
            
//            let fd = try? doc.getElementsByClass("fd_estimate clearfix").text()
//            print(fd ?? "")

          } catch {
            print("Error parsing HTML: \(error)")
          }
          
        case .failure(let error):
          print("Request failed with error: \(error)")
        }
      }
      
      
    }
    .onDisappear(perform: {
      print("SP500Viewを非表示")
    })
  }
  
}

//            let doc = try? SwiftSoup.parse(html) {
//          let price = try? doc.getElementsByClass("stock_price").first()?.text()
//          let fl = try? doc.getElementsByClass("fund_cv clearfix fd_box").first()?.text()
//          let fd = try? doc.getElementsByClass("fd_estimate clearfix").first()?.text()
//
//          print(price ?? 0)
//          print(fl ?? 0)
//          print(fd ?? 0)



#Preview {
  SP500View()
}
