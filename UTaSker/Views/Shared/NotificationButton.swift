//
//  NotificationButton.swift
//  UTaSker
//
//  Created by Jirapat Sivamard on 4/6/2025.
//

import SwiftUI

struct NotificationButtonView: View {
    
    var body: some View {
        NavigationLink(destination: NotificationsView()) {
            Image(systemName: "bell.badge")
                .symbolRenderingMode(.multicolor)
                .symbolVariant(.none)
                .fontWeight(.regular)
                .foregroundColor(.primaryBlue)
                .symbolEffect(.wiggle)
        }
        

    }
}


