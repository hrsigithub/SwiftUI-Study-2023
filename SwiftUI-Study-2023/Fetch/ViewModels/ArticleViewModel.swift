//
//  ArticleViewModel.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/22.
//

import Foundation
import Combine


class APIService {
    func fetchData(from url: URL) -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}


class ArticleViewModel: ObservableObject {
    @Published var qitaDatas: [Article] = []
    
    private let apiService = APIService()
    private var cancellables: Set<AnyCancellable> = []
    
    func get() {
        let url = URL(string: "https://qiita.com/api/v2/items")!
        
        apiService.fetchData(from: url)
            .decode(type: [Article].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] data in
                self?.qitaDatas = data
                print("vm_:\(data)")
            }
            .store(in: &cancellables)
    }
    
    func getArticles() async throws -> [Article] {
        
        do {
            let url = try getURL(endpoint: "https://qiita.com/api/v2/items")
            
            // -> (Data, URLResponse)を返却
            let (data, res) = try await URLSession.shared.data(from: url)

            guard let res = res as? HTTPURLResponse, res.statusCode == HTTPURLResponse.ok else {
                throw GHError.invalidResponce
            }
            print(String(data: data, encoding: .utf8)!)
            // 以下、ループ処理ではない
            do {
                let decoder = JSONDecoder()
                // スネークケースに変換
                //　convertFromSnakeCaseは特定の変数にできない。
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                return try decoder.decode([Article].self, from: data)
            } catch  {
                print(error)
                throw GHError.invalidData
            }

            
        } catch {
            print(error)
            throw GHError.invalidData
        }
    }
}
