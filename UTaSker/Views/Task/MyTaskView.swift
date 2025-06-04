//
//  MyTaskView.swift
//  UTaSker
//
//  Created by Pantita Maprasert on 2/6/2025.
//

import SwiftUI

struct MyTaskView: View {
    @State private var selectedTab = 0
    @State private var selectedFilter = "All"
    
    let filters = ["All", "Open", "Pending", "Ongoing", "Awaiting Review", "Completed", "Cancelled"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.primaryLight).ignoresSafeArea()
                
                VStack(spacing: 10) {
                    // Header with notification icon
                    HStack {
                        Text("Tasks")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        NotificationButtonView()
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
                                NavigationLink(destination: TaskDetailView(task: task)){
                                    MyTaskCardView(task: task)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
    
    var filteredTasks: [TaskModel] {
        // First filter by Posted/Applied (isMyTask)
        let baseTasks = selectedTab == 0
            ? SampleTasks.all.filter { $0.isMyTask } // Posted tasks (isMyTask = true)
            : SampleTasks.all.filter { !$0.isMyTask } // Applied tasks (isMyTask = false)
        
        // Then filter by status
        if selectedFilter == "All" {
            return baseTasks
        } else {
            return baseTasks.filter { $0.status.lowercased() == selectedFilter.lowercased() }
        }
    }

}

#Preview {
    MyTaskView()
}
