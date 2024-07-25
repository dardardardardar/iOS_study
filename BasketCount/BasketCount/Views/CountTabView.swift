//
//  ContentView.swift
//  BasketCount
//
//  Created by Jongwook Park on 7/25/24.
//

import SwiftUI

struct CountTabView: View {
    var body: some View {
        TabView {
            Text("5x5는 아직입니다")
                .tabItem {
                    Label("5x5", systemImage: "basketball")
                }
            
            GameView()
                .tabItem {
                    Label("3x3", systemImage: "basketball")
                }
        }
    }
}

#Preview {
    CountTabView()
}
