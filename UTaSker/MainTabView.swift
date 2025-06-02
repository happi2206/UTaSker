//
//  MainTabView.swift
//  UTaSker
//
//  Created by Happiness on 31/5/2025.
//
import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @State private var showPostSheet = false

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
                .tag(1)

            Color.clear
                .tabItem {
                    Image(systemName: "plus.square")
                    Text("Post")
                }
                .tag(2)


                
            MyTaskView()
                .tabItem {
                    Image(systemName: "tray.full")
                    Text("Tasks")
                }
                .tag(3)

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(4)
        }
        .onChange(of: selectedTab) {
            if selectedTab == 2 {
                showPostSheet = true
                selectedTab = 0
            }
        }
        .sheet(isPresented: $showPostSheet) {
            PostTaskView()
                .presentationDetents([.large])
                 .presentationDragIndicator(.visible)
          
        }
        .accentColor(.primaryBlue)
        .toolbarBackground(Color.white, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

