//
//  RootView.swift
//  UTaSker
//
//  Created by Jirapat Sivamard on 5/6/2025.
//

import SwiftUI

struct RootView: View {
    @StateObject private var authViewModel = AuthViewModel()

    var body: some View {
        Group {
            if authViewModel.isSignedIn {
                MainTabView()
            } else {
                SignInView()
            }
        }
        .environmentObject(authViewModel)
    }
}
#Preview {
    RootView()
}
