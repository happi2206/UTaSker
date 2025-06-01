//
//  TabView.swift
//  UTaSker
//
//  Created by Happiness on 1/6/2025.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab = 1

    var body: some View {
        VStack {
      
            TabView(selection: $selectedTab) {
                Text("Tab Content 1")
                    .tabItem {
                        Text("Reviews")
                    }
                    .tag(1)

                Text("Tab Content 2")
                    .tabItem {
                        Text("Settings")
                    }
                    .tag(2)
            }
        }
        .padding(.top, 30)
    }
}
#Preview {
    CustomTabView()
}
