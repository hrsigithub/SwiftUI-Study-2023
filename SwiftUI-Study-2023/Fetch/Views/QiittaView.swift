//
//  Qiitta.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/22.
//

import SwiftUI

//struct QiittaView: View {
//
//    private var vm = ArticleViewModel()
//    @State private var articles: [Article]
//
//    var body: some View {
//        VStack {
//            List {
//                ForEach($articles, id: \.self) { $item in
//                    TextField("name ?", text: $item.title)
//                }
//            }
////        }.onAppear {
////            vm.getArticles()
//        }
//        // 非同期のタスクを実行するために使用
//        .task {
//            do {
//                articles = try await vm.getArticles()
//            } catch GHError.invalidURL {
//                print("invalidURL")
//            } catch GHError.invalidResponce {
//                print("invalidResponce")
//            } catch GHError.invalidData {
//                print("invalidData")
//            } catch {
//                print("invalid else")
//            }
//        }
//    }
//}
//
//struct QiittaView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        QiittaView()
//    }
//}
struct QiittaView: View {
    
    private var vm = ArticleViewModel()
    @State private var articles: [Article] = []
    
    var body: some View {
        VStack {
            List {
                ForEach($articles, id: \.self) { $item in
                    TextField("name ?", text: $item.title)
                }
            }
        }
        .task {
            do {
                articles = try await vm.getArticles()
            } catch GHError.invalidURL {
                print("invalidURL")
            } catch GHError.invalidResponce {
                print("invalidResponce")
            } catch GHError.invalidData {
                print("invalidData")
            } catch {
                print("invalid else")
            }
        }
    }
}

struct QiittaView_Previews: PreviewProvider {
    
    static var previews: some View {
        QiittaView()
    }
}
