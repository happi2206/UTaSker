//
//  Button.swift
//  UTaSker
//
//  Created by Happiness on 1/6/2025.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    var icon: String? = nil
    var action: () -> Void

    var backgroundColor: Color = .blue
    var textColor: Color = .white
    var isDisabled: Bool = false
    var isLoading: Bool = false
    var fullWidth: Bool = true
    var cornerRadius: CGFloat = 12
    var fontSize: CGFloat = 16

    var body: some View {
        Button(action: {
            if !isDisabled && !isLoading {
                action()
            }
        }) {
            HStack(spacing: 8) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: textColor))
                } else if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(textColor)
                }

                Text(title)
                    .font(.system(size: fontSize, weight: .semibold))
                    .foregroundColor(textColor)
            }
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .padding()
            .background(
                backgroundColor
                    .opacity(isDisabled || isLoading ? 0.4 : 1.0)
            )
            .cornerRadius(cornerRadius)
        }
        .disabled(isDisabled || isLoading)
    }
}
