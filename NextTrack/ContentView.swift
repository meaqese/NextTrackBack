//
//  ContentView.swift
//  NextTrack
//
//  Created by me on 05.12.2024.
//

import SwiftUI

struct PlayNextBackgroundButtonStyle: ButtonStyle {
    @State private var isAnimated = false
    
    private var duration = 0.22
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .fill(.gray)
                .frame(width: 90)
                .opacity(isAnimated ? 0.15 : 0)
            
            configuration.label
        }
        .scaleEffect(isAnimated ? 0.86 : 1)
        .animation(.easeOut(duration: duration * 2), value: isAnimated)
        .onChange(of: configuration.isPressed) { _, newValue in
            if newValue {
                isAnimated = true
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    isAnimated = false
                }
            }
        }
    }
}


struct ContentView: View {
    @State private var isAnimated = false
    @State private var isBackAnimated = false
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
        .buttonStyle(PlayNextBackgroundButtonStyle())
    }
}

#Preview {
    ContentView()
}
