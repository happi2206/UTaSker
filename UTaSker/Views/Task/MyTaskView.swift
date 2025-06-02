//
//  MyTaskView.swift
//  UTaSker
//
//  Created by Pantita Maprasert on 2/6/2025.
//

import SwiftUI

struct MyTaskView: View {
    @State private var selectedTab = 0
    @State private var selectedFilter = "Pending"
    
    let filters = ["All", "Pending", "Ongoing", "Needs Review"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.primaryLight).ignoresSafeArea()
                
                VStack(spacing: 16) {
                    // Header with notification icon
                    HStack {
                        Text("Tasks")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Image(systemName: "bell.badge")
                            .symbolRenderingMode(.multicolor)
                            .fontWeight(.regular)
                            .foregroundColor(.primaryBlue)
                    }
                    .padding(.horizontal)
                    
                    // Posted/Applied Tabs
                    Picker("Task Type", selection: $selectedTab) {
                        Text("Posted").tag(0)
                        Text("Applied").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    
                    // Filter buttons
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(filters, id: \.self) { filter in
                                Button(action: {
                                    selectedFilter = filter
                                }) {
                                    Text(filter)
                                        .font(.subheadline)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(selectedFilter == filter ? Color.primaryBlue : Color.white)
                                        .foregroundColor(selectedFilter == filter ? .white : .primary)
                                        .cornerRadius(20)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Task List
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(filteredTasks) { task in
                                TaskCardView(task: task)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
    
    var filteredTasks: [Task] {
        if selectedFilter == "All" {
            return SampleTasks.all
        } else {
            // In a real app, we would filter based on actual task status
            // For now, just showing sample tasks
            return Array(SampleTasks.all.prefix(2))
        }
    }
}

#Preview {
    MyTaskView()
}
