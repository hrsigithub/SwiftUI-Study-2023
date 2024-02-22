//
//  LoginView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/21.
//

// https://www.youtube.com/watch?v=l7obVQObdRM&list=PLGL_UBWopPOGJ4iDd5OPEHeO_NWD66ivc&index=12&t=4s


import SwiftUI

struct LoginView: View {
  @State private var username = ""
  @State private var password = ""
//  @State private var wrongUsername = 0
//  @State private var wrongPassword = 0
  @State private var isLoginScreen = false
  @State private var isError = false

  var body: some View {
    NavigationStack {
      ZStack {
        Color.blue.ignoresSafeArea()
        Circle()
          .scale(1.7)
          .foregroundColor(.white.opacity(0.15))
        Circle()
          .scale(1.35)
          .foregroundColor(.white)

        VStack {
          Text("Login")
            .font(.largeTitle)
            .bold()
            .padding()
//            .foregroundColor(.primary)
          
          TextField("Username", text: $username)
            .padding()
            .frame(width: 300, height: 50)
//            .background(Color.black.opacity(0.05))
            .background(Color.primary.opacity(0.05))
            .cornerRadius(10)
            .border(.red, width: isError ? CGFloat(2) : CGFloat(0))

          SecureField("Password", text: $password)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.primary.opacity(0.05))
            .cornerRadius(10)
            .border(.red, width: isError ? CGFloat(2) : CGFloat(0))
            
          
          Button("Login") {
            authetcateUser(username: username, password: password)
          }
          .foregroundColor(.white)
          .frame(width: 300, height: 50)
          .background(.blue)
          .cornerRadius(10)
          .padding(15)
          
// 非推奨になったぽい
//          NavigationLink(
//            destination: Text("You are logged in @\(username)"),
//            isActive: $isLoginScreen,
//            label:{EmptyView()})
        }
        .navigationDestination(isPresented: $isLoginScreen) {
          Text("You are logged in @\(username)")
        }
        
        
      }
      .navigationBarHidden(true)

    }

    
    
  }
  
  func authetcateUser(username: String, password: String) {
    if username.lowercased() == "hiroro" {
//      wrongUsername = 0
      if password.lowercased() == "abc123" {
  //      wrongPassword = 0
        isError = false
        isLoginScreen = true
      } else {
        isError = true
    //    wrongPassword = 2
      }
    } else {
      isError = true
      //wrongUsername = 2
    }
  }
  
  
}

#Preview {
    LoginView()
}
