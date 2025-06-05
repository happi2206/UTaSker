//
//  SecureStyledField.swift
//  UTaSker
//
//  Created by Happiness on 5/6/2025.
//

import SwiftUI

struct SecureStyledField: View {
    var title: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            (
                Text(title)
                    .foregroundColor(.black) +
                Text("*")
                    .foregroundColor(.red)
            )
            .font(.system(size: 14))
            .fontWeight(.semibold)

            SecureField(placeholder, text: $text)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }
    }
}
