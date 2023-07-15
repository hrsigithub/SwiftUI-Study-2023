//
//  ObservedOrStateView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/15.
//

import SwiftUI


class MainViewModel: ObservableObject {
    @Published var mainCount = 0
}

class ObservedOjectViewModel : ObservableObject {
    @Published var observedCount = 0
    
    func addCount() {
        self.observedCount += 1
    }
}

class StateObjectViewModel: ObservableObject {
    @Published var count = 0
    
    func addCount() {
        self.count += 1
    }
}

struct ObservedOrStateView: View {
    
    @ObservedObject var viewmodel = MainViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                Text(viewmodel.mainCount.description)
                    .font(.title)
                
                NavigationLink("ObservedObject") {
                    ObservedOjectView(mainCount: $viewmodel.mainCount)
                }
                .font(.title)
                .padding()
                
                NavigationLink("StateObject") {
                    State2ObjectView(mainCount: $viewmodel.mainCount )
                }
                .font(.title)
                .padding()
            }
        }
    }
    
}


// @ObservedObject: 画面に入る時、初期化されない。 上位ページによって初期化される。
struct ObservedOjectView: View {
    @ObservedObject var viewmodel = ObservedOjectViewModel()
    @Binding var mainCount : Int
    
    var body: some View {
        VStack{
            Text("Observed : \(viewmodel.observedCount.description)")
                .font(.title)
                .padding()
                .onTapGesture {
                    viewmodel.addCount()
                }
            
            Button {
                self.mainCount += 1
            } label: {
                Text("change main view count")
                    .font(.title)
            }
            Text(self.mainCount.description)
                .font(.title)
            
        }
    }
}


// @StateObject: 画面に入る時、初期化される。　上位ページによって初期化されない。
struct State2ObjectView: View {
    @StateObject var viewmodel = StateObjectViewModel()
    @Binding var mainCount : Int
    
    var body: some View {
        VStack{
            Text("StateObject : \(viewmodel.count.description)")
                .font(.title)
                .padding()
                .onTapGesture {
                    viewmodel.addCount()
                }
            
            Button {
                self.mainCount += 1
            } label: {
                Text("change main view count")
                    .font(.title)
            }
            Text(self.mainCount.description)
                .font(.title)
        }
    }
}



struct ObservedOrStateView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedOrStateView()
    }
}
