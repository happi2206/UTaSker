//
//  UTaSkerApp.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI
import FirebaseCore

@main
struct UTaSkerApp: App {
    @AppStorage("hasLaunched") private var hasLaunched = false
    
    init() {
        FirebaseApp.configure()
        UITabBar.appearance().backgroundColor = .white
    }
    var body: some Scene {
        WindowGroup {
//            if hasLaunched {
                RootView()
            
//             else{
//                SplashScreenView {
//                    hasLaunched = true
//                }
//            }
        }
    }
}
