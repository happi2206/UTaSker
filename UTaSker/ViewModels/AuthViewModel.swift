//
//  AuthViewModel.swift
//  UTaSker
//
//  Created by Happiness on 5/6/2025.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import UIKit

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



extension AuthViewModel {
    func saveProfile(firstName: String, lastName: String, phoneNumber: String, selectedImage: UIImage?, bio: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(.failure(NSError(domain: "No user", code: 401)))
            return
        }

        func saveToFirestore(imageUrl: String?) {
            let db = Firestore.firestore()
            db.collection("users").document(user.uid).setData([
                "uid": user.uid,
                "firstName": firstName,
                "lastName": lastName,
                "phoneNumber": phoneNumber,
                "email": user.email ?? "",
                "imageUrl": imageUrl ?? "",
                "bio": bio
            ]) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    self.needsProfileSetup = false
                    self.isSignedIn = true
                    completion(.success(()))
                }
            }
        }

        // Upload image if it exists
        if let image = selectedImage,
           let data = image.jpegData(compressionQuality: 0.8) {
            let ref = Storage.storage().reference().child("profile_images/\(user.uid).jpg")
            ref.putData(data, metadata: nil) { _, error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    ref.downloadURL { url, err in
                        saveToFirestore(imageUrl: url?.absoluteString)
                    }
                }
            }
        } else {
            saveToFirestore(imageUrl: nil)
        }
    }
}
