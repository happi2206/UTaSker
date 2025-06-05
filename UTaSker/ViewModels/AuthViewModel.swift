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
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isSignedIn = false

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
}
