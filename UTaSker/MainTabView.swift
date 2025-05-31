//
//  MainTabView.swift
//  UTaSker
//
//  Created by Happiness on 31/5/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
 
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
                
            PostTaskView()
                .tabItem {
                    Image(systemName: "plus.square")
                    Text("Post")
                }
                
            SearchView()
                .tabItem {
                    Image(systemName: "tray.full")
                    Text("Tasks")
                }
                
            SearchView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .accentColor(.primaryBlue)
        .tabViewStyle(.automatic)
        .toolbarBackground(Color.white, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        
    }
}
