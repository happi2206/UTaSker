//
//  AuthViewModel.swift
//  UTaSker
//
//  Created by Happiness on 5/6/2025.
//

import Foundation
import FirebaseAuth

@MainActor
class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isSignedIn = false
    @Published var needsProfileSetup = false


    func signIn() async {
        guard email.contains("uts.edu.au") else {
            errorMessage = "Please use a valid UTS email address."
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            let _ = try await Auth.auth().signIn(withEmail: email, password: password)
            isSignedIn = true
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    func signUp() async {
        guard email.contains("uts.edu.au") else {
            errorMessage = "Please use a UTS email address."
            return
        }

        guard password.count >= 8 else {
            errorMessage = "Password must be at least 8 characters."
            return
        }


        isLoading = true
        errorMessage = nil

        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            isSignedIn = true
            needsProfileSetup = true
            try await result.user.sendEmailVerification()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
