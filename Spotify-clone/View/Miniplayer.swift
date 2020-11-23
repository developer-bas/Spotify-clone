//
//  Miniplayer.swift
//  Spotify-clone
//
//  Created by PROGRAMAR on 23/11/20.
//

import SwiftUI

struct Miniplayer: View {
    
    var animation: Namespace.ID
    @Binding var expand : Bool
    
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Image("album1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .cornerRadius(15)
                    
                Text("Beliver")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    Image(systemName: "play.fill")
                        .font(.title)
                        .foregroundColor(.white)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "forward.fill")
                        .font(.title)
                        .foregroundColor(.white)
                })
                
                
            }
            .padding(.horizontal)
        }
        
        .frame(maxHeight: expand ? .infinity : 80)
        .background(
            VStack(spacing:0){
                BlurView()
                Divider()
            }
            .onTapGesture(perform: {
                withAnimation(.spring()){
                    expand.toggle()
                }
            })
            
        )
        .ignoresSafeArea(/*@START_MENU_TOKEN@*/.keyboard/*@END_MENU_TOKEN@*/, edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        .offset(y: expand ? 0 : -48)
    }
}
