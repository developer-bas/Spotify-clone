//
//  ContentView.swift
//  Spotify-clone
//
//  Created by PROGRAMAR on 12/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var expand = false
    @Namespace var animation 
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom),content: {
            TabView{
                ContentItemView()
                    .font(.title)
                    .tabItem {
                        VStack{
                            Image(systemName: "house")
                            Text("Home")
                        }
                    }
                    .tag(0)
                
               SearchPage()
                    .font(.title)
                    .tabItem {
                        VStack{
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    }
                    .tag(1)
            }
            
            Miniplayer(animation: animation, expand: $expand)
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
