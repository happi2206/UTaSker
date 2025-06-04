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
            NotificationButtonView()
        }
        

    }
}


