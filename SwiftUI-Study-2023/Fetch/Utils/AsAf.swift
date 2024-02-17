//
//  AF.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/22.
//

import Foundation
//import Alamofire


class AsAf {

//    private var url: String
//
//    init(_ url: String) {
//        self.url = url
//    }
    static var shared = AsAf()

    func fetch2<T: Decodable>(url: String, type: T.Type, completion: @escaping ([T]) -> Void) {

//        AF.request(url)
//            .responseDecodable(of: [T].self) { response in
//                switch(response.result) {
//                case .success(let datas):
//                    completion(datas)
//
//                case .failure(let error):
//                    print("error:\(error)")
//                }
//
//            }

    }

    func fetch<T: Decodable>(url: String, type: T.Type, completion: @escaping (T) -> Void) {

//        AF.request(url)
//            .responseDecodable(of: T.self) { response in
//                switch(response.result) {
//                case .success(let datas):
//                    completion(datas)
//
//                case .failure(let error):
//                    print("error:\(error)")
//                }
//
//            }

    }

    func fetchAsync<T: Decodable>(url: String, type: T.Type, completion: @escaping (T) -> Void) {

        // 同期処理
//        let semaphore = DispatchSemaphore(value: 0)
//        let queue     = DispatchQueue.global(qos: .utility)

//        AF.request(url)
//            .responseDecodable(of: T.self, queue: queue) { response in
//                switch(response.result) {
//                case .success(let datas):
//
//                    completion(datas)
//
//                case .failure(let error):
//                    print("error:\(error)")
//                }
//
//                semaphore.signal()
//            }

    }



//    func get1(url: String, completion: @escaping ([Article]) -> Void) {
//
//        AF.request(url)
//        // レスポンスをJSON形式で受け取る
//
//        // [ { ... } ] で返却されるので、配列
//            .responseDecodable(of: [Article].self) { response in
//                //                print(response.result)
//
//                switch(response.result) {
//                case .success(let datas):
//                    guard let data = datas.first else {
//                        return
//                    }
//
//                    print("data:title:\(data.title)")
//                    print("data:user:\(data.user.name)")
//
//
//                case .failure(let error):
//                    print("error:\(error)")
//                }
//
//            }
//
//    }


}
