//
//  onboarding.swift
//  UTaSker
//
//  Created by Priyanka  Chhabaria on 4/6/2025.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            
            Group {
                Circle().fill(Color.blue.opacity(0.15))
                    .frame(width: 300)
                    .offset(x: -180, y: -400)

                Circle().fill(Color.red.opacity(0.15))
                    .frame(width: 250)
                    .offset(x: 180, y: -350)

                Circle().fill(Color.blue.opacity(0.12))
                    .frame(width: 200)
                    .offset(x: 200, y: 300)

                Circle().fill(Color.red.opacity(0.12))
                    .frame(width: 220)
                    .offset(x: -200, y: 350)

                Circle().fill(Color.blue.opacity(0.2))
                    .frame(width: 80)
                    .offset(x: -140, y: -100)

                Circle().fill(Color.red.opacity(0.2))
                    .frame(width: 60)
                    .offset(x: 130, y: -140)

                Circle().fill(Color.blue.opacity(0.15))
                    .frame(width: 50)
                    .offset(x: -100, y: 180)

                Circle().fill(Color.red.opacity(0.15))
                    .frame(width: 40)
                    .offset(x: 90, y: 220)
            }

            VStack(alignment: .leading, spacing: 20) {
                Spacer().frame(height: 60)

                // Centered Logo
                HStack {
                    Spacer()
                    Image("logo_transparent")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height:300)
                    Spacer()
                }

                // Welcome Text
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome to the fastest way to get things done")
                        .font(.system(size: 27, weight: .bold))
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)

                    Text("on campus")
                        .font(.system(size: 27, weight: .bold))
                        .foregroundColor(.blue)
                }
                .padding(.horizontal, 30)

                // Subtext
                Text("From quick favours to serious skills, find help or offer yours in seconds. Let’s get stuff done together.")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)

                Spacer()

                // Get Started Button
                Button(action: {}) {
                    Text("Get Started")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
                .padding(.horizontal, 40)

                // Sign In Text
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .foregroundColor(.gray)

                    Button(action: {}) {
                        Text("Sign In")
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                }
                .font(.system(size: 14))
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
