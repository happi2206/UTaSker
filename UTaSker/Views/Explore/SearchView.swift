//
//  SearchView.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: TaskViewModel = TaskViewModel()
   
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.primaryLight).ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 16) {
                    FiltersView()
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(SampleTasks.all) { task in
                                NavigationLink(destination: TaskDetailView(task: task)) {
                                    TaskCardView(task: task)
                                        .padding(.horizontal)
                                }
                            }
                        }
                        
                    }
                    
                    
                }
            }
        }
    }
}


#Preview {
    SearchView()
}
