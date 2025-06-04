//
//  LoginView.swift
//  UTaSker
//
//  Created by Ashton King on 4/6/2025.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var validSignIn: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sign In")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.textColor1)
                VStack {
                    Image("UTaskerLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 325)
                    
                    VStack(alignment: .leading) {
                        Text("UTS Email Address")
                        TextField("\("firstname.lastname@student.uts.edu.au")", text: $email)
                            .padding(6)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(.box)
                            )
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                        SecureField("Minimum 8 characters", text: $password)
                            .padding(6)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(.box)
                            )
                    }
                    .padding(.bottom)
                    Spacer()
                    PrimaryButton(
                        title: "Sign In",
                        action: { print("WAHA") },
                        backgroundColor: .blue,
                        textColor: .white
                    )
                }
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    SignInView()
}
