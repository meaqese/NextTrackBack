//
//  ContentView.swift
//  NextTrack
//
//  Created by me on 05.12.2024.
//

import SwiftUI


struct ContentView: View {
    @State private var isAnimated = false
    private var iconName = "play.fill"
    
    private var width: CGFloat = 62
    
    var body: some View {
        let playWidth = width / 2
        
        Button {
            withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                isAnimated = true
            } completion: {
                isAnimated = false
            }
        } label: {
            HStack(spacing: 0) {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: isAnimated ? playWidth : .zero)
                    .opacity(isAnimated ? 1 : 0)
                
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: playWidth)
                
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: isAnimated ? 0.5 : playWidth)
                    .opacity(isAnimated ? 0 : 1)
            }
        }
        .frame(width: width)
    }
}

#Preview {
    ContentView()
}
