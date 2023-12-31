//
//  ContentView.swift
//  Task14
//
//  Created by Hiroshi.Nakai on 2021/02/25.
//

import SwiftUI


struct Task14View: View {
    
    @State private var tasks: [Task] = [
        .init(name: "りんご", isDone: false),
        .init(name: "みかん", isDone: true),
        .init(name: "バナナ", isDone: false),
        .init(name: "パイナップル", isDone: true)
    ]
    
    @State private var isShowModal = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(tasks.indices, id: \.self) { index in
                        HStack {
                            CheckViewRow(task: $tasks[index])

                        }
                    }
                }
                .navigationBarItems(trailing: Button(action: {
                    isShowModal = true
                }) {
                    Text("+")
                        .font(.largeTitle)
                })
            }
        }
        .sheet(isPresented: $isShowModal, content: {
            TaskDetialView(
                didTapSave: { name in
                    guard !name.isEmpty else { return }
                    tasks.append(Task(name: name, isDone: false))
                    isShowModal = false
                },
                didTapCancel: {
                    isShowModal = false
                }
            )
        })
    }
}

//private struct TaskDetialView: View {
//    
//    
//    @State private var name: String = ""
//    
//    let didTapSave: (String) -> Void
//    let didTapCancel: () -> Void
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Button("Cancel") {
//                    didTapCancel()
//                }
//                Spacer()
//                Button("Save") {
//                    didTapSave(name)
//                }
//            }.padding()
//            
//            HStack {
//                Text("名前")
//                TextField("", text: $name)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(width: 100)
//            }
//            Spacer()
//        }
//    }
//}


//struct CheckViewRow: View {
//    var task: Task
//
//    var body: some View {
//        if task.isDone {
//            Image(systemName: "checkmark")
//                .foregroundColor(.red)
//        } else {
//            Image(systemName: "checkmark")
//                .hidden()
//        }
//        Text(task.name)
//        Spacer()
//    }
//}

struct Task14View_Previews: PreviewProvider {
    static var previews: some View {
        Task14View()
    }
}
