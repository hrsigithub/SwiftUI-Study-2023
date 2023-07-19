//
//  TodoListView.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2020/12/09.
//

import SwiftUI


// 端末幅
private var screenWidth = UIScreen.main.bounds.width


struct TodoListView: View {
    
    init() {
        debugPrint("端末幅:", screenWidth)
    }
    
    @State private var newItem: String = ""
    @State private var toDoList: [String] = ["買物", "洗濯"]
    
    var body: some View {
        VStack {
            
            HStack {
                Text("新しい予定の追加").font(.largeTitle).padding(.leading)
                Spacer()
            }
            
            HStack {
                TextField("新しい予定を入力してください。", text: $newItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: screenWidth / 2)
                
                
                Button(action: {
                    // ボタン押下
                    if (self.newItem != "") {
                        self.toDoList.append(self.newItem)
                        self.newItem = ""
                    }
                    
                    // 保存
                    UserDefaults.standard.set(self.toDoList, forKey: "toDoList")
                    
                    
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Text("追加").foregroundColor(.white)
                    }
                }
                
            }
            
            HStack {
                Text("To Do List").font(.largeTitle).padding(.leading)
                Spacer()
            }
            
            
            List(toDoList, id: \.self) { item in
                Text(item)
            }
            
            Spacer()
        }.onAppear() {
            // 画面が表示された場合に起動される。
            debugPrint("onAppear")
            
            guard let w = UserDefaults.standard.array(forKey: "toDoList") as? [String]
            else { return }
            
            self.toDoList = w
            
            
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
