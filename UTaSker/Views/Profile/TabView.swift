//
//  TabView.swift
//  UTaSker
//
//  Created by Happiness on 1/6/2025.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab = 1
    let bio: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Picker(selection: $selectedTab, label: Text("Picker"), content: {
                Text("Bio").tag(1)
                Text("Reviews").tag(2)
            })
            .pickerStyle(.segmented)
            
            if (selectedTab == 1) {
                Text(bio)
            }
            else if (selectedTab == 2) {
                
            
                ScrollView (.vertical){
                    VStack (alignment: .leading) {
                        ReviewRow(name: "Sigmund Freud", role: "Staff", comment: "Wonderful help, I'm rolling in my grave.", rating: 3)
                            .padding(.bottom)
                        
                        ReviewRow(name: "Sebastian Groundstroem", role: "Staff", comment: "Part of the best Apple Foundation Cohort I have ever taught.", rating: 5)
                            .padding(.bottom)
                        ReviewRow(name: "Friendly Grey Cat", role: "Student", comment: "Meow.", rating: 1)
                            .padding(.bottom)
                    }
                }
            }
        }
        .padding(.horizontal)
        
    }
}
#Preview {
    CustomTabView(bio: "TEST")
}
