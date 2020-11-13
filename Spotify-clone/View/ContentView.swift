//
//  ContentView.swift
//  Spotify-clone
//
//  Created by PROGRAMAR on 12/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomePage()
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
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
