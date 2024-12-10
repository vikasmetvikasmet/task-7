//
//  ContentView.swift
//  tasks
//
//  Created by Vika on 05.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false
    var body: some View {
        Button {
            if !isAnimating {
                withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                    isAnimating = true
                } completion: {
                    isAnimating = false
                }
            }
        } label: {
            GeometryReader { proxy in
                let width = proxy.size.width / 2
                let systemName = "play.fill"
                
                HStack(alignment: .center, spacing: 0) {
                    Image(systemName: systemName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: isAnimating ?  width: .zero)
                        .opacity(isAnimating ? 1 : .zero)
                    Image(systemName: systemName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: width)
                    Image(systemName: systemName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: isAnimating ? 0.5 : width)
                        .opacity(isAnimating ? .zero: 1)
                }
                .frame(maxHeight: .infinity, alignment: .center)
                .scaleEffect(0.86)
                
            }.frame(maxWidth: 62)
        }
    }
}

#Preview {
    ContentView()
}

