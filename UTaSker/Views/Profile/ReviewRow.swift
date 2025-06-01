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
                        .fontWeight(.semibold)
                    Text(role)
                        .foregroundColor(.textColor2)
                        .font(.footnote)
                }
            }

            if let comment = comment {
                Text(comment)
                    .font(.subheadline)
                    .padding(.top, 4)
            }
        }
    }
}
