//
//  Notification.swift
//  UTaSker
//
//  Created by Pantita Maprasert on 4/6/2025.
//

import SwiftUI

// Notification Model
struct NotificationItem: Identifiable {
    let id = UUID()
    let profileImage: String
    let message: String
    let subtitle: String
    let timeAgo: String
    let type: NotificationType
    var isRead: Bool
}

enum NotificationType {
    case taskApproved
    case review
    case message
    case offer
    
    var iconName: String {
        switch self {
        case .taskApproved:
            return "checkmark"
        case .review:
            return "star.fill"
        case .message:
            return "message.fill"
        case .offer:
            return "dollarsign"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .taskApproved:
            return .green
        case .review:
            return .yellow
        case .message:
            return .blue
        case .offer:
            return .orange
        }
    }
}

// Individual Notification Item View
struct NotificationItemView: View {
    let notification: NotificationItem
    
    var body: some View {
        HStack(spacing: 12) {
            // Profile Image
            ZStack(alignment: .bottomTrailing) {
                Image(notification.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                
                Image(systemName: notification.type.iconName)
                    .font(.system(size: 8, weight: .bold))
                    .foregroundColor(.white)
                    .padding(5)
                    .background(notification.type.iconColor)
                    .clipShape(Circle())
                    .offset(x: 1, y: -3)
            }
            
            // Content
            VStack(alignment: .leading, spacing: 4) {
                Text(notification.message)
                    .font(.system(size: 16, weight: .medium))
                
                Text(notification.subtitle)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                Text(notification.timeAgo)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
    }
}

// Main Notifications View
struct NotificationsView: View {
    @State private var notifications: [NotificationItem] = [
        NotificationItem(
            profileImage: "FemalePlaceholder",
            message: "Your task has been approved",
            subtitle: "Moving Help Needed! - $100",
            timeAgo: "30 min ago",
            type: .taskApproved,
            isRead: false
        ),
        NotificationItem(
            profileImage: "FemalePlaceholder",
            message: "You received a new review",
            subtitle: "Great work! Very friendly, arrived...",
            timeAgo: "1 hour ago",
            type: .review,
            isRead: false
        ),
        NotificationItem(
            profileImage: "FemalePlaceholder",
            message: "New message from Beyonce",
            subtitle: "Calculus Homework - $20",
            timeAgo: "1 hour ago",
            type: .message,
            isRead: true
        ),
        NotificationItem(
            profileImage: "FemalePlaceholder",
            message: "New offer received from Jane",
            subtitle: "Math Tutoring - $50",
            timeAgo: "2 hours ago",
            type: .offer,
            isRead: true
        )
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(notifications) { notification in
                        NotificationItemView(notification: notification)
                            .background(notification.isRead ? Color.white : Color("LightBlue"))
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                            .onTapGesture {
                                if let index = notifications.firstIndex(where: { $0.id == notification.id }) {
                                    notifications[index].isRead = true
                                }
                            }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
            .background(Color(uiColor: .primaryLight))
            .navigationTitle("Notifications(\(notifications.count))")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {}) {
//                        Image(systemName: "chevron.left")
//                            .foregroundColor(.black)
//                    }
//                }
//            }
//            .toolbarBackground(.white, for: .navigationBar)
           //           .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    NotificationsView()
}

