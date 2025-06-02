//
//  TaskStatusBadge.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI

enum TaskStatus: String {
    case open = "Open"
    case assigned = "Assigned"
    case pending = "Pending"
    case current = "Current"
    case completed = "Completed"
    case cancelled = "Cancelled"
    
    var color: Color {
        switch self {
        case .open:
            return Color.yellow
        case .assigned:
            return Color.blue
        case .pending:
            return Color.orange
        case .current:
            return Color.blue
        case .completed:
            return Color.green
        case .cancelled:
            return Color.gray
        }
    }
}

struct StatusBadge: View {
    var status: TaskStatus

    var body: some View {
        Text(status.rawValue)
            .font(.caption)
            .fontWeight(.semibold)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(status.color)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

#Preview {
    StatusBadge(status: .current)
    
}
