//
//  TaskDetailUIView.swift
//  UTaSker
//
//  Created by Ashton King on 2/6/2025.
//

import SwiftUI

struct TaskDetailView: View {
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "arrow.left")
                Text("Task Details")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.textColor1)
            }
            
            VStack {
                Text("Task")
                HStack {
                    Image(systemName: "truck.box")
                    VStack {
                        Text("Moving Help Needed!")
                        Text("Help me move my furniture into my student accommodation.")
                    }
                }
            }
            
            VStack {
                Text("Poster")
                HStack {
                    Image("MalePlaceholder")
                        .resizable()
                        .scaledToFit()
                    VStack {
                        Text("Ethan Harper")
                        Text("Student")
                        Text("ethan.harper@student.uts.edu.au")
                    }
                }
            }
            
            VStack {
                Text("Description")
                Text("I need help moving my furniture into my student accommodation. It's a small apartment, so it shouldn't take too long. The furniture is already in the lobby. I'm willing to pay $50 for the help.")
            }
            
            VStack {
                Text("Details")
                
                HStack {
                    Image(systemName: "calendar")
                    Text("May 29, 2025 · 10 AM")
                        .fontWeight(.medium)
                }
                
                HStack {
                    Image(systemName: "creditcard")
                    Text("$50")
                }
                
                VStack{
                    Text("Location")
                    Text("Building 11, Level 3, Room 300 (CB11.03.300)")
                }
                
                HStack {
                    VStack {
                        Text("Category")
                        Text("Labour")
                    }
                    
                    VStack {
                        Text("Requirements")
                        Text("Strong, good grip")
                    }
                }
                
            }
            
            Button("Send a Request") {
                print("wahoo")
            }
            .font(.title3)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding()
        }
    }
}

#Preview {
    TaskDetailView()
}
