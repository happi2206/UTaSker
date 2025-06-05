//
//  RootView.swift
//  UTaSker
//
//  Created by Jirapat Sivamard on 5/6/2025.
//

import SwiftUI

struct RootView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @State private var showSplash = true

    var body: some View {
        Group {
                    if showSplash {
                        SplashScreenView {
                            showSplash = false
                        }
                    } else {
                        if authViewModel.isSignedIn {
                            MainTabView()
                        } else {
                            SignInView()
                        }
                    }
                }
        .environmentObject(authViewModel)
    }
}
#Preview {
    RootView()
}
