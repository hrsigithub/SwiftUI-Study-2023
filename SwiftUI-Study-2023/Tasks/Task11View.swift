//
//  Kadai011View.swift
//  TaskChallenge
//
//  Created by Hiroshi.Nakai on 2021/02/23.
//

import SwiftUI

struct Task11View: View {
    @State private var isShowModal = false
    @State private var prefName: String?
    
    var body: some View {
        VStack {
            HStack {
                Text("都道府県").font(.title3).padding()
                Text(prefName ?? "未選択").font(.title3).padding()
                Button("入力") {
                    self.isShowModal.toggle()
                }.sheet(isPresented: $isShowModal
                ) {
                    Task11.PrefecturesView(isShowModal: $isShowModal, selectPref: $prefName)
                }
            }
            Spacer()
        }
    }
}

struct Task11 {
    struct PrefecturesView: View {
        @Binding var isShowModal: Bool
        @Binding var selectPref: String?
        
        var body: some View {
            VStack {
                HStack {
                    Button("Cancel") {
                        isShowModal.toggle()
                    }
                    Spacer()
                }.padding()
                
                VStack {
                    List {
                        ForEach(prefectureNames, id: \.self) { name in
                            Button("\(name)") {
                                selectPref = name
                                isShowModal.toggle()
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct Task11View_Previews: PreviewProvider {
    static var previews: some View {
        Task11View()
    }
}
