//
//  ContentView.swift
//  NextTrack
//
//  Created by me on 05.12.2024.
//

import SwiftUI


struct ContentView: View {
    @State private var animated = false
    
    var body: some View {
        Button {
            withAnimation(.bouncy(duration: 0.4, extraBounce: 0.2)) {
                animated = true
            }
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                animated = false
            }
        } label: {
            HStack(spacing: 0) {
                if animated {
                    Image(systemName: "play.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.blue)
                        .padding(.leading, -4)
                        .transition(.scale(scale: 0, anchor: .leading))
                }
            
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
                    .padding(.leading, -4)
                
                
                if !animated {
                    Image(systemName: "play.fill")
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
