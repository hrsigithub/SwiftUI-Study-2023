//
//  ContentView.swift
//  Task13View
//
//  Created by Hiroshi.Nakai on 2021/02/24.
//

import SwiftUI

struct task : Identifiable {
    var id = UUID()
    var fruitsName: String
    var isDone : Bool
}

struct Task13View: View {
    
    private var tasks: [task] = [
        .init(fruitsName: "りんご", isDone: false),
        .init(fruitsName: "みかん", isDone: true),
        .init(fruitsName: "バナナ", isDone: false),
        .init(fruitsName: "パイナップル", isDone: true),
        
    ]
    
    
    var body: some View {
        VStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        CheckView(isDone: task.isDone)
                        Text(task.fruitsName)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct CheckView: View {
    let isDone: Bool
    
    var body: some View {
        if isDone {
            Image(systemName: "checkmark")
                .foregroundColor(.red)
        } else {
            Image(systemName: "checkmark")
                .hidden()
        }
    }
}


struct Task13View_Previews: PreviewProvider {
    static var previews: some View {
        Task13View()
    }
}
