//
//  ArticleViewModel.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/22.
//

import Foundation
import Combine


//class ArticleViewModel : ObservableObject {
//
//    @Published var qitaDatas: [Article] = []
//
//    func get() {
//
//        let url = "https://qiita.com/api/v2/items"
//
//        AsAf.shared.fetch2(url: url, type: Article.self) { data in
//            self.qitaDatas = data
//
//            print("vm_:\(self.qitaDatas)")
//        }
//    }
//}



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
}
