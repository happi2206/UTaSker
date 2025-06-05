//
//  verification.swift
//  UTaSker
//
//  Created by Priyanka  Chhabaria on 4/6/2025.
//

import SwiftUI

struct VerificationView: View {
    @State private var code: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?

    var body: some View {
        VStack(spacing: 24) {
            
            ZStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                    Spacer()
                }
                Text("Verify your email")
                    .font(.system(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)

            // Email instruction
            Text("To access U-TASKER, please verify your UTS email.\nA verification code has been sent to:\n**pantita.maprasert@student.uts.edu.au**")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.horizontal)

            // OTP boxes
            HStack(spacing: 12) {
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: $code[index])
                        .keyboardType(.numberPad)
                        .frame(width: 45, height: 55)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .focused($focusedField, equals: index)
                }
            }

            // Resend
            Button(action: {

            }) {
                Text("Didn't receive the code? Resend")
                    .font(.footnote)
                    .foregroundColor(.black)
                    .underline()
            }

            // Verify button
            Button(action: {

            }) {
                Text("Verify")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top)
        .background(Color.white.ignoresSafeArea())
    }
}


#Preview {
    VerificationView()
}
