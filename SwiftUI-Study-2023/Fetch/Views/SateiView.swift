//
//  satei.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/04/23.
//

import SwiftUI

struct SateiView: View {

    @StateObject var vm = SateiViewModel()
    @State var ランク区分 = 1

    var body: some View {
        VStack {
            HStack {
                Text(String(vm.comHeaderData.店舗CD))
                Text(vm.comHeaderData.店舗名)
            }
            if vm.isLoading && vm.sateidatas.count <= 0 {
            } else {
                Text("選択：\(ランク区分)")

                HStack {
                    //                Text("天気")
                    //
                    //                Picker(selection: $select, label: Text("天気")) {
                    //                    Image(systemName: "sun.min").tag("晴れ")
                    //                    Image(systemName: "cloud").tag("曇り")
                    //                    Image(systemName: "cloud.rain").tag("雨")
                    //                }
                    ////                .frame(width: 200, height: 100, alignment: .center)
                    //                .clipped()

                    let _ = print("ランク1:", ランク区分)
                    let _ = print("ランク2:", vm.sateidatas.count > 0 ? vm.sateidatas.first!.ランク区分 : 99)
                    let _ = print("satei?", vm.sateidatas)

                    Text("ランク")
                    Picker(selection: $ランク区分, label: Text("ランク")) {
//                    Picker(selection: $vm.sateidatas.first!.ランク区分, label: Text("ランク")) {
                        ForEach(vm.ranks, id: \.self) { item in
                            Text(item.名称).tag(item.CD)
                        }

                    }
    //                .frame(width: 200, height: 100, alignment: .center)
                    .clipped()




                }

            }


//            List {
//                ForEach($vm.sateidatas) { $item in
//
//                    HStack {
//                        //                    TextField("", text: Binding($item.商品名称漢字)!) nil だと死ぬ
//                        TextField("", text: $item.商品名称漢字.toUnwrapped(defaultValue: ""))
//                        Text("受付:" + String(item.受付NO))
//                    }
//                }
//            }
            
            

        }.onAppear {
            vm.get()
        }
    }
}

struct SateiView_Previews: PreviewProvider {
    static var previews: some View {
        SateiView()
    }
}
