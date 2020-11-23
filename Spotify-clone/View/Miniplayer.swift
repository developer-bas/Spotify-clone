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
    
    var height = UIScreen.main.bounds.height / 3
    
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State var volume : CGFloat = 0
    
    @State var offset : CGFloat = 0
    
    var body: some View {
        VStack{
            
            
            Capsule()
                .fill(Color.gray)
                .frame(width:  expand ? 60 : 0 , height:  expand ? 4 : 0 )
                .opacity( expand ? 1 : 0 )
                .padding(.top, expand ? safeArea?.top : 0)
                .padding(.vertical, expand ? 30 : 0)
            
            HStack(spacing: 15){
                
                if expand{Spacer(minLength: 0)}
                Image("album1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: expand ? height : 55, height: expand ? height : 55)
                    .cornerRadius(15)
                    
                if !expand{
                    Text("Beliver")
                        .font(.title)
                        .fontWeight(.bold)
                        .matchedGeometryEffect(id: "Label", in: animation)
                }
                
                Spacer(minLength: 0)
                
                if !expand{
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
                
            }
            .padding(.horizontal)
            
            VStack(spacing: 15){
                
                Spacer(minLength: 0)
                
                HStack{
                    if expand{
                        Text("Beliver")
                            .font(.title)
                            .foregroundColor(.primary)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "Label", in: animation)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                }
                .padding()
                .padding(.top, 20 )

                HStack{
                    Capsule()
                        .fill(
                        
                            LinearGradient(gradient: .init(colors: [Color.white.opacity(0.7),Color.white.opacity(0.1)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        )
                        .frame(height: 4)
                    Text("LIVE")
                    
                    Capsule()
                        .fill(
                        
                            LinearGradient(gradient: .init(colors: [Color.white.opacity(0.1),Color.white.opacity(0.7)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        )
                        .frame(height: 4)
                    
                }
                .padding()
                
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "stop.fill")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                    
                })
                .padding()
                
                
                Spacer(minLength: 0)
                
                
                HStack(spacing: 15){
                    Image(systemName: "speaker.fill")
                    
                    Slider(value: $volume)
                    
                    Image(systemName: "speaker.wave.2.fill")
                }
                .padding()
                
                HStack(spacing: 22){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "arrow.up.message")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "airplayaudio")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "list.bullet")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                }
                .padding(.bottom,safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
                
                
                
                
                
            }
            .frame( height:  expand ? nil : 0 )
            .opacity( expand ? 1 : 0 )
        }
        
        .frame(maxHeight: expand ? .infinity : 80)
        .background(
            VStack(spacing:0){
                BlurView()
                Divider()
            }
            .onTapGesture(perform: {
                withAnimation(.spring()){
                    expand = true
                }
            })
            
        )
        .cornerRadius( expand ? 20 : 0)
        .offset(y: expand ? 0 : -48)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onended(value:)).onChanged(onchanged(value:)))
        .ignoresSafeArea()
    }
    
    func onchanged(value: DragGesture.Value){
        if value.translation.height > 0 && expand {
            offset = value.translation.height
        }
    }
    
    func onended(value: DragGesture.Value){
        withAnimation(.interactiveSpring(response: 0.5,dampingFraction: 0.95 , blendDuration: 0.95)){
            
            if  value.translation.height > height {
                expand = false
            }
            
            offset = 0
        }
    }
    
    
}
