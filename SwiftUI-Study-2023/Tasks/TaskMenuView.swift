//
//  TaskMenu.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/09.
//

import SwiftUI

// let KadaiViews: [View] = [
//    Task1View()
// ]

struct TaskMenuView: View {
    var body: some View {
        NavigationView {
            List(1..<21) { index in
                NavigationLink(destination: getTaskView(index: index)) {
                    Text("課題\(index)")
                }
            }
            .navigationTitle("課題チャレンジ")
        }
    }
    
    @ViewBuilder
    private func getTaskView(index: Int) -> some View {
        switch index {
        case 1:
            Task1View()
        case 2:
            Task2View()
        case 3:
            Task3View()
        case 4:
            Task4View()
        case 5:
            Task5View()
        case 6:
            Task6View()
        case 7:
            Task7View()
        case 8:
            Task8View()
        case 9:
            Task9View()
        case 10:
            Task10View()
        case 11:
            Task11View()
        case 12:
            Task12View()
        case 13:
            Task13View()
        case 14:
            Task14View()
        case 15:
            Task15View()
        default:
            Text("まだ未完成だわ")
        }
    }
}

struct TaskMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TaskMenuView()
    }
}
