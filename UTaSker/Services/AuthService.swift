//
//  AuthService.swift
//  UTaSker
//
//  Created by Happiness on 4/6/2025.
//


import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    
    private func isValidUTSEmail(_ email: String) -> Bool {
        return email.lowercased().hasSuffix("@uts.edu.au")
    }

    func signUp(
        email: String,
        password: String,
        completion: @escaping (Result<User, Error>) -> Void
    ) {
        guard isValidUTSEmail(email) else {
            let error = NSError(
                domain: "",
                code: 400,
                userInfo: [NSLocalizedDescriptionKey: "Please use a UTS email address."]
            )
            completion(.failure(error))
            return
        }
        
        Auth
            .auth()
            .createUser(withEmail: email, password: password) { result, error in
                if let user = result?.user {
                    user.sendEmailVerification()
                    completion(.success(user))
                } else {
                    completion(.failure(error ?? NSError()))
                }
            }
    }

    func login(
        email: String,
        password: String,
        completion: @escaping (Result<User, Error>) -> Void
    ) {
        guard isValidUTSEmail(email) else {
            let error = NSError(
                domain: "",
                code: 400,
                userInfo: [NSLocalizedDescriptionKey: "Please use a UTS email address."]
            )
            completion(.failure(error))
            return
        }
        
        Auth
            .auth()
            .signIn(withEmail: email, password: password) {
 result,
 error in
                if let user = result?.user,
 user.isEmailVerified {
                    completion(.success(user))
                } else if let user = result?.user,
                          !user.isEmailVerified {
                    let error = NSError(
                        domain: "",
                        code: 401,
                        userInfo: [NSLocalizedDescriptionKey: "Email not verified. Please check your inbox."]
                    )
                    completion(.failure(error))
                } else {
                    completion(.failure(error ?? NSError()))
                }
            }
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }
}
