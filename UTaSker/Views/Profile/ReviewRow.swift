//
//  ReviewRow.swift
//  UTaSker
//
//  Created by Happiness on 2/6/2025.
//

import SwiftUI

struct ReviewRow: View {
    let name: String
    let role: String
    let comment: String?
    let rating: Int

    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                Image("MalePlaceholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 42, height: 42)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .fontWeight(.semibold).multilineTextAlignment(.leading)
                    Text(role)
                        .foregroundColor(.textColor2)
                        .font(.footnote).multilineTextAlignment(.leading)
                }
            }
            RatingsRow(rating: rating, numRatings: 0, showRatingCount: false)
            if let comment = comment {
                Text(comment)
                    .font(.subheadline)
                    .padding(.top, 4)
            }
        }
    }
}

#Preview {
    ReviewRow(name: "DUMMY", role: "DUMMY", comment: "I'M A DUMMY", rating: 3)
}
