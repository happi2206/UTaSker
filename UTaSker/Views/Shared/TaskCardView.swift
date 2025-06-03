//
//  TaskCardView.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//


import SwiftUI

struct TaskCardView: View {
    let task: TaskModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(task.date) · \(task.time)")
                    .font(.subheadline)
                    .foregroundColor(.textColor1)
                    .fontWeight(.medium)

                Spacer()

                Text(task.price)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.textColor1)
            }

            HStack(spacing: 12) {
                Image(systemName: task.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding()
                    .foregroundColor(.primary)
                    .background(Color.lightBlue)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(task.title)
                        .font(.subheadline)
                        .foregroundColor(.textColor1)
                        .fontWeight(.medium)

                    Text("\(task.building) · \(task.distance)")
                        .font(.footnote)
                        .foregroundColor(.textColor2)
                }
            }.padding(.top, 3)

     
                Text(task.description)
                    .font(.subheadline)
                    .foregroundColor(.textColor2)
                    .multilineTextAlignment(.leading)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
       
    }
}

#Preview {
    TaskCardView(task: TaskModel(
        date: "Thu 29 May",
        time: "10 AM",
        title: "Laptop Setup",
        building: "Building 11",
        distance: "150m",
        description: "Organize books back unto the shelves in alphabetical order",
        iconName: "laptopcomputer",
        price: "$30",
        status: "Completed",
        isMyTask: false,
      isCurrentTask: false
    ))
}
