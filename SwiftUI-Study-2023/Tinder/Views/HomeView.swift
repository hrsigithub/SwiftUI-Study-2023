//
//  ContentView.swift
//  Tinder
//
//  Created by Hiroshi.Nakai on 2022/03/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        VStack {
            TopView()
            CardView()
            BotomView()
        }
    }
}

struct CardView : View {
    
    @State var transation: CGSize = .zero
    @State var numbers = [0, 1, 2, 3, 4, 5]
    
    
    var body: some View {
        
        GeometryReader(content: { geometry in
            
            ForEach(numbers, id: \.self) { number in
                ZStack {
                    ZStack {
                        Image("syokotan")
                            .resizable()
                            .scaledToFill()
                            .background(Color.white)
                        
                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                    }
                    .frame(width: geometry.size.width - 20, height: geometry.size.height)
                    .cornerRadius(10)
                    .padding(.all, 10)
                    .shadow(radius: 5)
                    
                    
                    VStack {
                        
                        HStack {
                            Text("GOOD")
                                .font(.system(size: 40, weight: .heavy))
                                .foregroundColor(.green)
                                .padding(.all, 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.green, lineWidth: 4)
                                )
                            
                            Spacer()
                            
                            Text("NOPE")
                                .font(.system(size: 40, weight: .heavy))
                                .foregroundColor(.red)
                                .padding(.all, 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.red, lineWidth: 4)
                                )
                        }
                        .padding(.all, 30)
                        
                        Spacer()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("しょこたん")
                                    .foregroundColor(.white)
                                    .font(.system(size: 45, weight: .heavy))
                                
                                Text("北海道")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .medium))
                                
                                Text("サッカー")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25, weight: .medium))
                                
                                Text("サッカ大好きです")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25, weight: .medium))
                            }
                            .padding(.leading, 20)
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "info.circle.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 40, height: 40)
                                
                            })
                            .padding(.trailing, 50)
                            
                        }
                        .frame(width: geometry.size.width - 20)
                        .padding(.bottom, 40)
                        
                    }
                    
                }
                .offset(self.numbers.last == number ? transation : .zero)
                .rotationEffect(self.numbers.last == number ? .degrees(Double(self.transation.width / 300 * 20)) : .zero)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.transation = value.translation
                            print("value.location: ", value.location)
                        })
                        .onEnded({ value in
                            if value.startLocation.x - 150 > value.location.x {
                                // 左側にフェードアウトする
                                self.transation = .init(width: -800, height: 0)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    self.numbers.removeLast()
                                    self.transation = .zero
                                }
                                
                            } else if value.startLocation.x + 150 < value.location.x {
                                // 右側にフェードアウトする
                                self.transation = .init(width: 800, height: 0)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    self.numbers.removeLast()
                                    self.transation = .zero
                                }
                                
                            } else {
                                // 元の位置にもどる
                                self.transation = .zero
                            }
                        })
                )
//                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1))
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1), value: 0)


            }
            
        })
    }
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}

