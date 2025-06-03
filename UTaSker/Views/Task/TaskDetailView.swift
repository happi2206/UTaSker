//
//  TaskDetailUIView.swift
//  UTaSker
//
//  Created by Ashton King on 2/6/2025.
//

import SwiftUI

struct TaskDetailView: View {
    let task: TaskModel
    @State var showStatusSheet = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    //Button {
                    Image(systemName: "arrow.left")
                    
                    Spacer()
                    
                    Text("Task Details")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.textColor1)
                        .offset(x: -10)
                    Spacer()
                    if(task.isMyTask){
                        Image(systemName: "square.and.pencil")
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Task")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.textColor1)
                        .padding(.bottom, 15)
                    HStack {
                        Image(systemName: "truck.box")
                            .resizable()
                            .aspectRatio(1.0, contentMode: .fill)
                            .frame(width: 14, height: 14)
                            .padding()
                            .foregroundColor(.primary)
                            .background(Color.lightBlue)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .font(.subheadline)
                                .foregroundColor(.textColor1)
                                .fontWeight(.medium)
                            Text(task.description.components(separatedBy: ".")[0] + ".")
                                .font(.footnote)
                                .foregroundColor(.textColor2)
                        }
                        Spacer()
                    }
                }
                .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("Poster")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.textColor1)
                        .padding(.bottom, 10)
                    HStack {
                        Image("MalePlaceholder")
                            .resizable()
                            .frame(maxWidth: 50, maxHeight: 50)
                            .scaledToFit()
                        
                        VStack(alignment: .leading) {
                            Text("Ethan Harper")
                                .font(.subheadline)
                                .foregroundColor(.textColor1)
                                .fontWeight(.medium)
                            Text("Student")
                                .font(.footnote)
                                .foregroundColor(.textColor2)
                            Text("ethan.harper@student.uts.edu.au")
                                .font(.footnote)
                                .foregroundColor(.textColor2)
                        }
                        //.frame(maxWidth: .infinity)
                        //.padding()
                        Spacer()
                    }
                }
                .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.textColor1)
                        .padding(.bottom, 10)
                    HStack {
                        Text(task.description)
                            .font(.footnote)
                            .foregroundColor(.textColor2)
                            .lineSpacing(CGFloat(7))
                        Spacer()
                    }
                }
                .padding(.bottom, 25)
                
                VStack(alignment: .leading) {
                    Text("Details")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.textColor1)
                        .padding(.bottom, 15)
                    
                    HStack {
                        Image(systemName: "calendar")
                        Text("\(task.date) · \(task.time)")
                            .fontWeight(.medium)
                    }
                    
                    Divider()
                        .padding(.vertical, 5)
                    
                    HStack {
                        Image(systemName: "creditcard")
                        Text(task.price) //
                    }
                    
                    Divider()
                        .padding(.vertical, 5)
                    
                    VStack(alignment: .leading) {
                        Text("Location")
                            .font(.footnote)
                            .foregroundColor(.textColor2)
                        Text(task.building)
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Divider()
                                .padding(.vertical, 5)
                            Text("Category")
                                .font(.footnote)
                                .foregroundColor(.textColor2)
                            Text("Labour")
                        }
                        
                        VStack(alignment: .leading) {
                            Divider()
                                .padding(.vertical, 5)
                            Text("Requirements")
                                .font(.footnote)
                                .foregroundColor(.textColor2)
                            Text("Strong, good grip")
                        }
                    }
                    
                }
                
                Spacer()
                if(task.isMyTask){
                    PrimaryButton(title: "View Offers") {
                        print("yayyy")
                    }
                }
                else if (!task.isMyTask && !task.isCurrentTask) {
                    PrimaryButton(title: "Send a Request") {
                        print("wahoo")
                    }
                }
                else if (task.isCurrentTask) {
                    PrimaryButton(title: "Update Status") {
                        showStatusSheet = true
                            
                    }
                }
                
            }
        }
        .sheet(isPresented: $showStatusSheet) {
                TaskStatusSheetView()
                .presentationDetents([.fraction(CGFloat(0.45))])
                    .presentationDragIndicator(.visible)
        }
        .padding()
    }
}

#Preview {
    TaskDetailView(task: TaskModel(
        date: "Thu 29 May",
        time: "10 AM",
        title: "Laptop Setup",
        building: "Building 11",
        distance: "150m",
        description: "Need help setting up a new laptop. I recently bought a Mac and its my first time using one. Can someone with Mac experience teach me how to get it set up? I've gotta test how long this can get so I'm just gonna keep writing and writing and blah blah blah wahooooooooooooooooooooooooooooo",
        iconName: "laptopcomputer",
        price: "$30",
        status: "Completed",
        isMyTask: true,
        isCurrentTask: false))
}
