//
//  User.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI

class UserModel: Identifiable {
    @State private(set) var id: UUID
    @State private(set) var email: String
    @State var firstName: String
    @State var lastName: String
    @State var phoneNum: UInt
    @State var bio: String?
    @State var reviews: [ReviewModel]?
    @State var imgName: String?
    
    init(email: String, firstName: String, lastName: String, phoneNum: UInt, bio: String? = nil, reviews: [ReviewModel]? = nil, imgName: String? = nil) {
        self.id = UUID()
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNum = phoneNum
        self.bio = bio
        self.reviews = reviews
        self.imgName = imgName
    }
    
    init(email: String = "dummy.user@student.uts.edu.au", firstName: String = "Dummy🧍", lastName: String = "User", phoneNum: UInt = 0404040404, bio: String = "I'm just a dummy user. I sure hope I can get all my tasks done, I really need the money 🙏.", reviews: [ReviewModel]? = nil) {
        let temp = UUID()
        self.id = temp
        self.email = email
        self.firstName = firstName
        self.lastName = lastName + ": " + temp.uuidString.components(separatedBy: "-")[0]   // the dummy lastname now contains a portion of the dummy ID e.g. "User:E621E1F8"
        self.phoneNum = phoneNum
        self.bio = bio
        self.reviews = reviews
        self.imgName = "dummy"
    }
    
    static func ==(lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func !=(lhs: UserModel, rhs: UserModel) -> Bool {
        return !(lhs == rhs)
    }
    
//    static func GetUserByID(id: UUID) -> UserModel {
//        return nil // IMPLEMENT SEARCH FOR USER LIST
//    }
    
    
    
}

struct ReviewModel: Identifiable {
    private(set) var id: UUID
    private(set) var reviewer: UserModel
    private(set) var rating: Int
    private(set) var text: String?
    
    init(reviewer: UserModel, rating: Int, text: String? = nil) {
        self.id = UUID()
        self.reviewer = reviewer
        self.rating = rating
        self.text = text
    }
}
