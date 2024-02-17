//
//  TopListViewModel.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2020/12/14.
//

import Foundation


class TopListViewModel: ObservableObject {
    
//    @Published var eventData: [Event] = []
    
//    private var studyGroup = [StudyGroup]()

    
    func fetch() async throws -> StudyGroup {
        do {
            let url = try getURL(endpoint: "https://connpass.com/api/v1/event/?keyword=YUMEMI.swift")
            
            // -> (Data, URLResponse)を返却
            let (data, res) = try await URLSession.shared.data(from: url)
            
            guard let res = res as? HTTPURLResponse, res.statusCode == HTTPURLResponse.ok else {
                throw GHError.invalidResponce
            }
            print(String(data: data, encoding: .utf8)!)
            
            do {
                let decoder = JSONDecoder()
                
                return try decoder.decode(StudyGroup.self, from: data)
            } catch  {
                print(error)
                throw GHError.invalidData
            }
            
        }
    }
    
    
}
