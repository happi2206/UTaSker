//
//  TaskCardView.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

//import Foundation
import SwiftUI

struct MyTaskCardView: View {
    let task: TaskModel

    var body: some View {
        //let formatter = DateFormatter()
        //.dateFormat = "dd MMM yyyy, h:mm a"
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(task.date.formatted())
                    .font(.subheadline)
                    .foregroundColor(.textColor1)
                    .fontWeight(.medium)

                Spacer()
                Text(task.price.associatedValue())
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

                    Text(task.location)
                        .font(.footnote)
                        .foregroundColor(.textColor2)
                }
            }.padding(.top, 3)
            HStack{
                StatusText(isMyTask: task.isMyTask, status: task.taskStatus, numberOfOffers: 3)
                
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
       
    }
}

#Preview {
    MyTaskCardView(task: TaskModel(
        id: UUID(),
        posterID: UUID(),
        taskerID: nil,
        date: DateComponents(calendar: .current, year: 2025, month: 6, day: 1, hour: 10).date!,
        duration: "1 hour",
        title: "Tech booth setup",
        description: "Help with setting up tech booth cables and monitors.",
        location: "Building 6",
        iconName: "desktopcomputer",
        price: .payment(20),
        category: .labour,
        requirements: [.field("Familiar with cable setup")],
        images: ["Home1"],
        taskStatus: .pending,
        isMyTask: true
    ))
}
