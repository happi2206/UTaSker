//
//  LoginView.swift
//  UTaSker
//
//  Created by Ashton King on 4/6/2025.
//

import SwiftUI

private enum Field {
    case email, password
}

struct SignInView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @FocusState private var focusField: Field?
    @State private var navigateToHome = false
    
 
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sign In")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.textColor1)

                Image("UTaskerLogo")
                    .resizable()
                    .scaledToFit()

                VStack(alignment: .leading) {
                    Text("UTS Email Address")
                    TextField(
                        "\("firstname.lastname@student.uts.edu.au")",
                        text: $viewModel.email
                    )
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .submitLabel(.next)
                    .padding(6)
                    .focused($focusField, equals: .email)
                    .onSubmit { focusField = .password }
                }
                .padding(.bottom)

                VStack(alignment: .leading) {
                    Text("Password")
                    SecureField(
                        "Minimum 8 characters",
                        text: $viewModel.password
                    )
                    .textFieldStyle(.roundedBorder)
                    .submitLabel(.done)
                    .padding(6)
                    .focused($focusField, equals: .password)
                    .onSubmit { focusField = nil }
                }
                .padding(.bottom)

                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                }

            
                
                PrimaryButton(
                    title: viewModel.isLoading ? "Signing In..." : "Sign In",
                    action: {
                        Task {
                            await viewModel.signIn()
                    
                            print(viewModel.isSignedIn ? "signed in" : "not signed in")
                            
//                            if viewModel.isSignedIn {
//                                navigateToHome = true
//                            }
                        }
                    },
                    isDisabled: !isValidInput,
                    isLoading: viewModel.isLoading ? true: false,
                )
                .padding(.top)
            }
            .padding()
//            .navigationDestination(isPresented: $navigateToHome) {
//                MainTabView()
            //  }
        }
    }

    var isValidInput: Bool {
        viewModel.email.contains("@") &&
        viewModel.password.count >= 8 &&
        viewModel.email.contains("uts.edu.au")
    }
}



#Preview {
    SignInView()
        .environmentObject(AuthViewModel())
}
