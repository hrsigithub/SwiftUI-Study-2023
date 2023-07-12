//
//  BottomView.swift
//  Tinder
//
//  Created by Hiroshi.Nakai on 2022/03/25.
//

import SwiftUI




struct BotomView: View {
    
    private var frameWidth: CGFloat{
        UIScreen.main.bounds.width
    }
    
    
    var body: some View {
        
        HStack(spacing: 20) {
            BotomButton(imageName: "goforward", imageSize: 20, backgroudSize: 50)
            BotomButton(imageName: "xmark", imageSize: 25, backgroudSize: 60)
            BotomButton(imageName: "star", imageSize: 20, backgroudSize: 50)
            BotomButton(imageName: "arrow.up.message.fill", imageSize: 25, backgroudSize: 60)
            BotomButton(imageName: "airtag", imageSize: 20, backgroudSize: 50)
        }
        .padding()
        .frame(width: frameWidth)
        //            .background(.red)
        
        
    }
    
}

struct BotomButton: View {
    
    var imageName: String
    var imageSize: CGFloat
    var backgroudSize: CGFloat
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .asRoundShadow(size: backgroudSize)
            
            Button(action: {
            }, label: {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize
                           , height: imageSize, alignment: .center)
                
            })
            
        }
        
        
    }
    
}


struct BotomView_Previews: PreviewProvider {
    static var previews: some View {
        BotomView()
    }
}



