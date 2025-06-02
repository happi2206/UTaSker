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
        VStack(alignment: .leading) {
            Picker(selection: $selectedTab, label: Text("Picker"), content: {
                Text("Bio").tag(1)
                Text("Reviews").tag(2)
            })
            .pickerStyle(.segmented)
            
            if (selectedTab == 1) {
                Text("This is my bio! I can write stuff about myself or what I'm good at 😎. I can't think of any 🤔 so I'm just going to keep talking until I run out of things to say 😁.")
            }
            else if (selectedTab == 2) {
                ReviewRow(name: "Sigmund Freud", role: "Staff", comment: "Wonderful help, I'm rolling in my grave.")
                ReviewRow(name: "Sebastian Groundstroem", role: "Staff", comment: "Part of the best Apple Foundation Cohort I have ever taught.")
                ReviewRow(name: "Friendly Grey Cat", role: "Student", comment: "Meow.")
                
            }
        }
        .padding(.horizontal)
    }
}
#Preview {
    CustomTabView()
}
