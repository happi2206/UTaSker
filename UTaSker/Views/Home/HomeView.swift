//
//  ContentView.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI
 
struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.primaryLight).ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                
                                Text("Hi Ashton 👋")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.textColor1)
                            }
                            Spacer()
                            Button() {
                                print("hey")
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            } label: {
                                NotificationButtonView()
                            }
                            
                            
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                        
                        VStack(alignment: .leading) {
                            Text("Due soon")
                                .font(.headline)
                                .padding(.horizontal)
                                .foregroundColor(.textColor1)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(SampleTasks.all) { task in
                                        DueSoonTaskCard(task: task)
                                        
                                    }
                                }.padding(.leading)
                                
                            }
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Recent")
                                .font(.headline)
                                .padding(.horizontal)
                                .foregroundColor(.textColor1)
                            
                            VStack (spacing: 16) {
                                ForEach(SampleTasks.all) { task in
                                    NavigationLink(destination: TaskDetailView(task: task)) {
                                        TaskCardView(task: task)
                                            .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
