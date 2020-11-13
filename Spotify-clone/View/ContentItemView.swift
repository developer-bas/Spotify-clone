//
//  ContentItemView.swift
//  Spotify-clone
//
//  Created by PROGRAMAR on 12/11/20.
//

import SwiftUI

struct ContentItemView: View {
    var topSpacerHeight: CGFloat = 400
    var backColor = Color.init(red: 61/255, green: 89/255 , blue: 115/255)
   @State var playButtonOffSet: CGFloat = 335
    
    var body: some View {
        ZStack {
//            Layer 0
//            Color.init(red: 61/255, green: 89/255 , blue: 115/255) .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            LinearGradient(gradient: Gradient(colors: [ backColor, Color.black,Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            Layer 1
            VStack{
                Spacer().frame(height: 20)
                Image("Colores")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Title")
                    .foregroundColor(.white)
                    .font(.system(size: 24,weight: .bold ))
                Text("Subtitle")
                    .foregroundColor(.init(red: 0.5, green: 0.5, blue: 0.5))
                    .font(.system(size: 17,weight: .medium ))
                Spacer()
            }
//            Layer 2
            ScrollView {
                GeometryReader{ geo  -> AnyView?  in
                    let thisOffSet = geo.frame(in: .global).minY
                    
                    if thisOffSet > -300 {
                        self.playButtonOffSet = thisOffSet
                    }else{
                        self.playButtonOffSet = -300
                    }
                    
                    
                    
                    return nil
                }
                VStack(spacing:0){
                    HStack {
                        Spacer()
                            .frame(height: topSpacerHeight)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear, Color.clear, Color.clear, Color.black]), startPoint: .top, endPoint: .bottom))
                    }
                    
                    VStack {
                        ForEach(0..<15){ indicato in
                            HStack {
                                
                                CustomSongCell()
                                Spacer()
                            }
                            
                        }
                    }.background(Color.black.opacity(1))
                    
                }.background(Color.clear)
                
            }
            VStack{
                LinearGradient(gradient: Gradient(colors: [ backColor, Color.clear]), startPoint: .top, endPoint: .bottom).frame(height: 200)
                Spacer()
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            Layer 3
            VStack {
                Spacer()
                    .frame(height: playButtonOffSet + 300)
                
                HStack{
                    if(playButtonOffSet > -300) {
                        Text("Play")
                    }else{
                        Image(systemName: "play.fill")
                    }
                }
                .foregroundColor(.white)
                .frame(width: getPlayButtonWidth(), height : 50)
                .background(Color.init(red: 30/255, green: 215/255, blue: 96/255 ))
                .cornerRadius(25)
                .font(.system(size: 20, weight: .bold))
                .shadow(radius: 20)
                Spacer()
            }
//            Layer 4
            VStack{
                HStack{
                    Image(systemName: "chevron.left")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .foregroundColor(.white)
                .padding(25)
                Spacer()
            }
//            Observer layer
//            VStack{
//                Text("\(playButtonOffSet)").foregroundColor(.yellow)
//                Spacer()
//            }
        }
    }
    
    func getPlayButtonWidth()-> CGFloat{
        if playButtonOffSet > -150{
            return 240
        } else if playButtonOffSet <= -300 {
            return 50
        }else{
            var width: CGFloat = 240 - (190*(((-1 * playButtonOffSet) - 150)/150))
            return width
        }
    }
}

struct ContentItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemView()
    }
}
