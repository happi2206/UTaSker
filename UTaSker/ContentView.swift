//
//  ContentView.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.6, green: 0.1, blue: 0.1), // Dark red
                    Color(red: 0.05, green: 0.1, blue: 0.3)  // Dark blue
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // UTASKER text
            Text("UTASKER")
                .font(.system(size: 48, weight: .bold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .blue.opacity(0.8),
                            .white
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        }
    }
}

#Preview {
    ContentView()
}
