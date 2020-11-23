//
//  BlurView.swift
//  Spotify-clone
//
//  Created by PROGRAMAR on 23/11/20.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) ->  UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
        
        return view
        
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
//        
    }
}

