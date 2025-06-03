//
//  TaskCardView.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//


import SwiftUI

struct MyTaskCardView: View {
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
                    .aspectRatio(1.0, contentMode: .fill)
                    .frame(width: 14, height: 14)
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
            HStack{
                StatusText(isMyTask: task.isMyTask, status: task.status, numberOfOffers: 3)
                
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
       
    }
}

#Preview {
    MyTaskCardView(task: TaskModel(
        date: "Thu 29 May",
        time: "10 AM",
        title: "Laptop Setup",
        building: "Building 11",
        distance: "150m",
        description: "Need help setting up a new laptop",
        iconName: "laptopcomputer",
        price: "$30",
        status: "pending",
        isMyTask: true,
        isCurrentTask: false
        
    ))
}
