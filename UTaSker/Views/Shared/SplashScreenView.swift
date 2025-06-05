//
//  SplashScreenView.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI



struct SplashScreenView: View {
    var onFinished: () -> Void
    @State private var isActive = false
    let transition: ContentTransition = .identity
    @State private var playTransition: Bool = false

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
                
                
          
                
                VStack {
                    
                    HStack(spacing: 0) {
                        Text("UT")
                            .foregroundColor(.primaryBlue)
                        Text("A")
                            .foregroundColor(.white)
                        Text("S")
                            .foregroundColor(.primaryBlue)
                        Text("KER")
                            .foregroundColor(.white)
                    }
                    .font(
                        .system(size: playTransition ? 48 : 16, weight: .bold)
                    )
                    .scaleEffect(playTransition ? 1.0 : 0.6)
                    .opacity(playTransition ? 1 : 0)
                    .animation(.easeInOut(duration: 2), value: playTransition)
                    
                    HStack(spacing: 8) {
                        Text("Earn.")
                            .foregroundColor(.primaryBlue)
                            .opacity(playTransition ? 1 : 0)
                            .offset(y: playTransition ? 0 : 10)
                            .animation(.easeOut(duration: 0.8).delay(0.6), value: playTransition)

                        Text("Connect.")
                            .fontWeight(.bold)
                            .opacity(playTransition ? 1 : 0)
                            .offset(y: playTransition ? 0 : 10)
                            .animation(.easeOut(duration: 0.8).delay(0.8), value: playTransition)

                        Text("Thrive.")
                            .foregroundColor(.primaryRed)
                            .opacity(playTransition ? 1 : 0)
                            .offset(y: playTransition ? 0 : 10)
                            .animation(.easeOut(duration: 0.8).delay(1.0), value: playTransition)
                    }
                    .font(.headline)
                    .foregroundColor(.white)

                }
                .onAppear {
                    playTransition = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                        withAnimation {
                            onFinished()
                        }
                    }
                }            
        }
    }
}


#Preview {
    SplashScreenView{}
}
