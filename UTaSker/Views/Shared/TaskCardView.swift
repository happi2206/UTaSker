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
//            let formatter = DateFormatter()
//            formatter.dateFormat = "dd MMM yyyy, h:mm a"
            HStack {
                Text(task.date.formatted())
                    .font(.subheadline)
                    .foregroundColor(.textColor1)
                    .fontWeight(.medium)

                Spacer()
//                var price : String
//                if case .payment(let amount) = task.price {
//                    price = ("$\(amount)")
//                } else if case .reward(let rewardText) = task.price {
//                    price = rewardText
//                }
                Text(task.price.associatedValue())
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

                    Text(task.location)
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
