//
//  SplashScreenView.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI



struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            HomeView()
        } else {
            
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
//                    Image("Logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 200, height: 200)
                    
                    Text("UTASKER")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .blue.opacity(0.8),
                                    .red
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    Text("Earn. Connect. Thrive.")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 42.0) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    SplashScreenView()
}
