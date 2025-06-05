//
//  SignupView.swift
//  UTaSker
//
//  Created by Happiness on 5/6/2025.
//
import SwiftUI

struct SignupView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @State private var confirmPassword = ""
    @State private var navigateToCreateProfile = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {

                    HStack {
                        Button(action: {
                            // Handle back navigation if needed
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Text("Create your account")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.left")
                            .opacity(0)
                    }
                    .padding(.horizontal)

                    Image("UTaskerLogo")
                        .resizable()
                        .scaledToFit().frame(width: 200, height: 200)

                    Group {
                        StyledField(
                            title: "UTS Email Address",
                            placeholder: "Firstname.lastname@student.uts.edu.au",
                            text: $authViewModel.email,
                            keyboardType: .emailAddress
                        )
                        SecureStyledField(
                            title: "Create a Password",
                            placeholder: "Minimum 8 characters",
                            text: $authViewModel.password
                        )
                        SecureStyledField(
                            title: "Confirm your Password",
                            placeholder: "",
                            text: $confirmPassword
                        )
                    }

                    if let error = authViewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
                    }

                    PrimaryButton(
                        title: authViewModel.isLoading ? "Signing Up..." : "Sign Up",
                        action: {
                            guard authViewModel.password
                                .trimmingCharacters(
                                    in: .whitespacesAndNewlines
                                ) ==
                                    confirmPassword
                                .trimmingCharacters(in: .whitespacesAndNewlines) else {
                                authViewModel.errorMessage = "Passwords do not match"
                                return
                            }

                            Task {
                                await authViewModel.signUp()
                                if authViewModel.isSignedIn {
                                    navigateToCreateProfile = true
                                }
                            }
                        },
                        isDisabled: !isValidInput || authViewModel.isLoading,
                        isLoading: authViewModel.isLoading
                    )
                    .padding(.top)


                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        
                        NavigationLink(destination: SignInView()) {
                            Text("Sign In")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .font(.footnote)
                        }
                    }

                    
                    .navigationDestination(
                        isPresented: $authViewModel.needsProfileSetup
                    ) {
                        SetupAccountView()
                    }

                }
                .padding()
            }
            .background(Color.white)
            .navigationBarHidden(true)
        }
    }

    var isValidInput: Bool {
        !authViewModel.email.isEmpty &&
        authViewModel.password.count >= 8 &&
        confirmPassword == authViewModel.password
    }

}


#Preview {
    SignupView().environmentObject(AuthViewModel())
}

