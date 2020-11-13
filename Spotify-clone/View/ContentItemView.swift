//
//  ContentItemView.swift
//  Spotify-clone
//
//  Created by PROGRAMAR on 12/11/20.
//

import SwiftUI

struct ContentItemView: View {
    var topSpacerHeight: CGFloat = 400
    var playButtonOffSet: CGFloat = 335
    
    var body: some View {
        ZStack {
//            Layer 0
//            Color.init(red: 61/255, green: 89/255 , blue: 115/255) .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            LinearGradient(gradient: Gradient(colors: [Color.init(red: 61/255, green: 89/255 , blue: 115/255), Color.black,Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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
                VStack(spacing:0){
                    HStack {
                        Spacer()
                            .frame(height: topSpacerHeight)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear, Color.clear, Color.clear, Color.black]), startPoint: .top, endPoint: .bottom))
                    }
                    
                    VStack {
                        ForEach(0..<10){ indicato in
                            HStack {
                                
                                CustomSongCell()
                                Spacer()
                            }
                            
                        }
                    }.background(Color.black.opacity(1))
                    
                }.background(Color.clear)
                
            }
//            Layer 3
            VStack {
                Spacer()
                    .frame(height: playButtonOffSet)
                Text("Play")
                    .foregroundColor(.white)
                    .frame(width: 240, height : 50)
                    .background(Color.init(red: 30/255, green: 215/255, blue: 96/255 ))
                    .cornerRadius(25)
                    .font(.system(size: 20, weight: .bold))
                Spacer()
            }
        }
    }
}

struct ContentItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemView()
    }
}
