//
//  TopListView.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2020/12/14.
//

import SwiftUI

struct TopListView: View {
    
//    @ObservedObject var vm = TopListViewModel()
//    @State private var studyGroup:StudyGroup = StudyGroup(events: mockEventsData)
    @State private var events:[Event] = []
                               

    var body: some View {
        NavigationView {
            List(events) { event in
                NavigationLink(destination: Text("詳細")) {
                    EventRowView(eventData: event)
                }
            }
            .navigationBarTitle(Text("YUMEMI.swift一覧"))
        }
        .task {
            do {
                let studyGroup:StudyGroup = try await fetch(url: "https://connpass.com/api/v1/event/?keyword=YUMEMI.swift")
                events = studyGroup.events
                
                
                
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

struct TopListView_Previews: PreviewProvider {
    static var previews: some View {
        TopListView()
    }
}
