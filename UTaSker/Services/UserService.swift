//
//  UserstoreService.swift
//  UTaSker
//
//  Created by Happiness on 5/6/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserService {
    static let shared = UserService()
    private let db = Firestore.firestore()

    func fetchUserProfile(uid: String? = Auth.auth().currentUser?.uid, completion: @escaping (UserProfile?) -> Void) {
        guard let uid = uid else {
            print("❌ No UID found.")
            completion(nil)
            return
        }

        db.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                print("❌ Firestore error: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = snapshot?.data() else {
                print("❌ No data found for user \(uid)")
                completion(nil)
                return
            }

            print("✅ User data: \(data)")
            
            if let first = data["firstName"] as? String {
                let profile = UserProfile(
                    uid: uid,
                    firstName: first,
                    lastName: data["lastName"] as? String ?? "",
                    phoneNumber: data["phoneNumber"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    imageUrl: data["imageUrl"] as? String ?? "",
                    bio: data["bio"] as? String ?? ""
                )
                completion(profile)
            } else {
                print("❌ firstName field missing or not a String.")
                completion(nil)
            }
        }
    }

}
