//
//  FaceView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/15.
//

import SwiftUI

struct FaceView: View {
    var body: some View {
        VStack {
            
            ZStack {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: 300, height: 300)
                
                
                VStack {
                    
                    HStack {
                        Rectangle()
                            .frame(width: 60, height: 20)
                        
                        // Eyes
                        ZStack {
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: 90, height: 90)
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 70, height: 70)
                            Rectangle()
                                .frame(width: 20, height: 20)
                        }
                        ZStack {
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: 90, height: 90)
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 70, height: 70)
                            Rectangle()
                                .frame(width: 20, height: 20)
                        }
                        
                        Rectangle()
                            .frame(width: 60, height: 20)
                        
                    }
                    // 口
                    ZStack {
                        Rectangle()
                            .frame(width: 70, height: 40)
                        
                        VStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 60, height: 10)
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: 60, height: 10)
                        }
                    }
                }
            }
            
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            HStack {
                Rectangle()
                    .frame(width: 70, height: 30)
                Rectangle()
                    .frame(width: 70, height: 30)
            }
        }
        
    }
}

#Preview {
    FaceView()
}
