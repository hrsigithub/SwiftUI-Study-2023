//
//  InputView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/10.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
        //            .keyboardType(.decimalPad)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black.opacity(0.5), lineWidth: 1)
            )
    }
}



struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        
        @State  var dummy = "dummy"
        InputView(text:$dummy)
    }
}


struct CheckViewRow: View {
    @Binding var task: Task
    
    var body: some View {
        
        Button(action: {
            task.isDone.toggle()
        }) {
            if task.isDone {
                Image(systemName: "checkmark")
                    .foregroundColor(.red)
            } else {
                Image(systemName: "checkmark")
                    .hidden()
            }
        }
        
        Text(task.name)
        Spacer()
    }
}

struct TaskDetialView: View {
    
    @State private var name: String = ""
    
    let didTapSave: (String) -> Void
    let didTapCancel: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    didTapCancel()
                }
                Spacer()
                Button("Save") {
                    didTapSave(name)
                }
            }.padding()
            
            HStack {
                Text("名前")
                TextField("", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
            }
            Spacer()
        }
    }
}
