//
//  GithubUser.swift
//  Landmarks
//
//  Created by Hiroshi.Nakai on 2023/07/07.
//

import SwiftUI

//　アクセストークン不要
// https://api.github.com/users/hrsigithub


//　カスタムエラー　Errorロトコルを準拠する必要がある
enum GHError :Error{
    case invalidURL
    case invalidResponce
    case invalidData
    
}

// 200の定数ないので定義
extension HTTPURLResponse {
    static let ok: Int = 200
}



struct GithubUserView: View {
    
    @State private var user:GitHubUser?
    
    var body: some View {
        VStack(spacing: 20) {
            
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
            .frame(width: 120, height: 120)
            
            
            Text(user?.login1 ?? "Login User")
                .bold()
                .font(.title)
            
            Text(user?.bio ?? "user bio is not")
                .padding()
            
            Spacer()
            
        }
        .padding()
        
        // 非同期のタスクを実行するために使用
        .task {
            do {
                user = try await getUser(userId: "hrsigithub")
            } catch GHError.invalidURL {
                print("invalidURL")
            } catch GHError.invalidResponce {
                print("invalidResponce")
            } catch GHError.invalidData {
                print("invalidData")
            } catch {
                print("invalid else")
            }
        }
    }
}




struct GithubUser_Previews: PreviewProvider {
    static var previews: some View {
        GithubUserView()
    }
}
