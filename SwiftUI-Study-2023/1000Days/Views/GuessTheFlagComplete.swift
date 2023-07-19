//
//  GuessTheFlagComplete.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/05/11.
//

import SwiftUI

//struct GuessTheFlagComplete: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct GuessTheFlagComplete_Previews: PreviewProvider {
//    static var previews: some View {
//        GuessTheFlagComplete()
//    }
//}


struct GuessTheFlagButtonAlert: View {

    @State private var showingAlert = false

    var body: some View {

        // アラート表示
        Button("Show Alert") {
            showingAlert = true
        }
        //        .alert("Important message", isPresented: $showingAlert) {
        //            Button("OK") { }
        //        }
        //        .alert("Important message", isPresented: $showingAlert) {
        //            Button("Delete", role: .destructive) { }
        //            Button("Cancel", role: .cancel) { }
        //        }
        .alert("Important message", isPresented: $showingAlert) {
            //            Button("Delete", role: .destructive) { }
            //            Button("Cancel", role: .cancel) { }
            Button("OK", role: .cancel) { }
        } message: {
            Text("Please read this.")
        }

    }
}

struct GuessTheFlagButton: View {


    var body: some View {
        VStack {

            // ボタンにが画像＆ラベル
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
            }

            // ボタンにが画像
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
            }

            // ボタンにView
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
            }

            VStack {
                Button("Button 1") { }
                    .buttonStyle(.bordered)

                Button("Button 2", role: .destructive) { }
                    .buttonStyle(.bordered)

                Button("Button 3") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)

                Button("Button 4", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
            }



            // ボタンでのクロージャー書き方

            // 1
            Button("Delete selection", action: executeDelete)

            // 2
            Button("Delete selection") {
                print("Now deleting…1")
            }

            // 削除役割付与
            Button("Delete selection", role: .destructive, action: executeDelete)
        }



    }

    func executeDelete() {
        print("Now deleting…2")
    }

}

struct GuessTheFlag1: View {
    var body: some View {
        ZStack {
            //            Color.red
            ////                .frame(width: 200, height: 200)
            //                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            //            Text("Hello, world!")
            //            Text("                                     This is inside a stack")

            VStack(spacing: 0) {
                Color.red
                Color.blue
            }

            Text("Your content")
                .foregroundColor(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        //        .background(.red)
        .ignoresSafeArea()

    }
}
