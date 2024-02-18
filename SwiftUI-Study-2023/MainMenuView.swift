//
//  MainMenuView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/11.
//

import SwiftUI

let Menus = ["課題チャレンジ", "Landmark", "Tinder", "Qiitta", "Face", "map", "消費税計算", "サイコロ", "SP500"]

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            List(0..<Menus.count, id: \.self) { index in
                NavigationLink(destination: getMenuView(index: index)) {
                    Text(Menus[index])
                }
            }
            .navigationTitle("メインメニュー")
        }
    }
    
    @ViewBuilder
    private func getMenuView(index: Int) ->  some View {
        switch index {
        case 0:
            TaskMenuView()
        case 1:
            LandmarkList()
        case 2:
            HomeView()
        case 3:
            QiittaView()
        case 4:
            FaceView()
        case 5:
            Map2View()
        case 6:
            TaxCalcView()
        case 7:
          DiceView()
        case 8:
          SP500View()

        default:
            Text("まだ未完成だわ")
        }
    }

}



struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
