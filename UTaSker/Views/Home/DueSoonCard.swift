//
//  DueSoonCard.swift
//  UTaSker
//
//  Created by Happiness on 31/5/2025.
//
import SwiftUI

struct DueSoonTaskCard: View {
    let task: TaskModel

    var body: some View {
        NavigationLink(destination: TaskDetailView(task: task)) {
            VStack(alignment: .leading, spacing: 4) {
                Image(task.images?.first ?? "Home1")
                    .resizable().aspectRatio(1.0, contentMode: .fill).frame(height: 100)    .clipped()
                Text(task.title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .padding(.top, 6)
                
                Text(task.description)
                    .font(.caption)
                    .foregroundColor(.textColor2)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .truncationMode(.tail)
                    .padding(.bottom, 16)
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(10)
            .frame(width: 120,  height: 200)
        }
    }
}
