//
//  PostTaskView.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI

struct PostTaskView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Post a task")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Spacer()

                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.gray)
                            .font(.title3)
                    }
                }
                .padding(.top, 30)
                .padding(.horizontal)

                TaskFormView()
            }

            .padding(.bottom, 40)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    PostTaskView()
}
