//
//  welcomepage.swift
//  UTaSker
//
//  Created by Priyanka  Chhabaria on 4/6/2025.
//

import SwiftUI

struct welcomepage: View {
    var body: some View {
        VStack(spacing: 0) {
            
            
            HStack {
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                }
            }

            Spacer().frame(height: 50)

            
            Image("logo_transparent")
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .padding(.bottom, 20)

            // Title
            Text("Welcome to U-TASKER!")
                .font(.system(size: 18, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)

            // Description
            Text("Your account has been successfully created.\nYou can now start exploring, posting and\nconnecting with others.")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Spacer()

            // Start Exploring Button
            Button(action: {
                
            }) {
                Text("Start Exploring")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0/255, green: 122/255, blue: 255/255)) // 
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
        .background(Color.white.ignoresSafeArea())
    }
}

#Preview {
    welcomepage()
}
