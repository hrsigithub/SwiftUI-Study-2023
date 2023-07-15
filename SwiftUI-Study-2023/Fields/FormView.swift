//
//  FormView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/13.
//

import SwiftUI


// struct User {
//    var name: String
//    var password: String
//
//    // Memberwise Initializerがあるため不要だが、インスタンス時に初期化が必須
//    init() {
//        name = ""
//        password = ""
//    }
//}


struct FormView: View {
    
    @State private var user = User()
    
    var body: some View {
        Form {
            TextField(text: $user.name, prompt: Text("Required")) {
                Text("Username")
            }
            SecureField(text: $user.password, prompt: Text("Required")) {
                Text("Password")
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
