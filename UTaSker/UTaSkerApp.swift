//
//  UTaSkerApp.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI

@main
struct UTaSkerApp: App {
    @AppStorage("hasLaunched") private var hasLaunched = false
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    var body: some Scene {
        WindowGroup {
            if hasLaunched {
                MainTabView()
            }
            else{
                SplashScreenView {
                    hasLaunched = true
                }
            }
        }
    }
}
