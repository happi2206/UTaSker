//
//  ProfileView.swift
//  UTaSker
//
//  Created by Happiness on 1/6/2025.
//


import SwiftUI

struct ProfileView: View {
    
    @State private var userName: String = ""
    @State private var userEmail: String = ""
    @State private var userImage: String = ""
    @State private var bio: String = ""
 
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
           
                HStack {
                    Spacer()
                    Text("Profile")
                        .font(.headline)
                    Spacer()
                    NotificationButtonView()
                }
                .padding(.horizontal)

                VStack(spacing: 3) {
                    AsyncImage(url: URL(string: userImage)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())

                    
                    Text(userName)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.textColor1)
                    
                    Text(userEmail)
                        .foregroundColor(.textColor2)
                }.padding(.top, 10)
        
                RatingsRow(rating: 2, numRatings: 100, showRatingCount: true)
 
                HStack(spacing: 10) {
                    ReviewBanner( text: "On Time")
                    ReviewBanner(text: "Attention to Detail")
                    ReviewBanner(text: "Fast Response")
                }
          

        
                PrimaryButton(
                    title: "Edit Profile",
                    icon: "pencil",
                    action: { print("Edit tapped") },
                    backgroundColor: .lightBlue,
                    textColor: .textColor1,
                 
                )
                .padding(.horizontal)
                .padding(.top)
                CustomTabView(bio: bio)
                
            }
            .padding(.top)
        }
        
        .onAppear {
            UserService.shared.fetchUserProfile { profile in
                if let profile = profile {
                    self.userName = profile.firstName
                    self.userEmail = profile.email
                    self.userImage = profile.imageUrl ?? ""
                    self.bio = profile.bio
                    
                } else {
                    self.userName = "User"
                }
            }
        }
    }
}

struct ReviewBanner: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.blue.opacity(0.1))
            .clipShape(Capsule())
            .multilineTextAlignment(.center)
    }
}

struct RatingsRow: View {
    @State var rating: Int
    @State var numRatings: Int
    @State var showRatingCount: Bool
    
    init(rating: Int, numRatings: Int, showRatingCount: Bool) {
        self.rating = rating
        self.numRatings = numRatings
        self.showRatingCount = showRatingCount
    }
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(index + 1 <= rating ? .yellow : .mainGray)
            }
            if (showRatingCount) {
                Text("(\(numRatings) Reviews)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
#Preview {
    ProfileView()
}
