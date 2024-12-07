//
//  ContentView.swift
//  NextTrack
//
//  Created by me on 05.12.2024.
//

import SwiftUI


struct ContentView: View {
    @State private var isAnimated = false
    var duration: CGFloat = 0.4
    var iconName = "play.fill"
    
    var body: some View {
        Button {
            withAnimation(.bouncy(duration: duration, extraBounce: 0.2)) {
                isAnimated = true
            }
        
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                isAnimated = false
            }
        } label: {
            HStack(spacing: 0) {
                if isAnimated {
                    Image(systemName: iconName)
                        .font(.largeTitle)
                        .foregroundStyle(.blue)
                        .padding(.leading, -4)
                        .transition(.scale(scale: 0, anchor: .leading))
                }
            
                Image(systemName: iconName)
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
                    .padding(.leading, -4)
                
                
                if !isAnimated {
                    Image(systemName: iconName)
                        .font(.largeTitle)
                        .foregroundStyle(.blue)
                        .padding(.leading, -4)
                        .transition(.scale(scale: 0, anchor: .trailing).combined(with: .opacity))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
