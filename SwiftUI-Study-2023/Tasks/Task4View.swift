//
//  ContentView.swift
//  task4
//
//  Created by Hiroshi.Nakai on 2021/02/16.
//

import SwiftUI

struct Task4View: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text(String(count))
                .padding()

            Button("+") {
                count += 1
            }.padding()

            Button("clear") {
                count = 0
            }

            Spacer()

        }
    }
}


struct Task4View_Previews: PreviewProvider {
    static var previews: some View {
        Task4View()
    }
}
