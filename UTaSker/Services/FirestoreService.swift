//
//  FirestoreService.swift
//  UTaSker
//
//  Created by Happiness on 4/6/2025.
//

import FirebaseFirestore
import FirebaseAuth


//temporary user model cuz i dont have ashtons changes yet rip - happi
struct UserProfile: Codable {
    let uid: String
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String
}

class FirestoreService {
    static let shared = FirestoreService()
    private let db = Firestore.firestore()

    func saveUserProfile(_ profile: UserProfile, completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection("users").document(profile.uid).setData([
            "firstName": profile.firstName,
            "lastName": profile.lastName,
            "phoneNumber": profile.phoneNumber,
            "email": profile.email
        ]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}


