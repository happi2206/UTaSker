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
    
    @State private var isOffersSheetShowing: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    
                    
                    //                    Text("")
                    //                        .font(.title3)
                    //                        .fontWeight(.bold)
                    //                        .foregroundColor(.textColor1)
                    //                        .offset(x: -10)
                    //                    Spacer()
               
                }
                .padding(.horizontal, 8)
                
                ScrollView {
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
                                Text(
                                    task.description
                                        .components(separatedBy: ".")[0] + "."
                                ) //task.description.components(separatedBy: ".")[0] + "."
                                .font(.footnote)
                                .foregroundColor(.textColor2)
                            }
                            Spacer()
                        }
                    }
                    .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        HStack (alignment: .top) {
                            Text("Poster")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.textColor1)
                                .padding(.bottom, 10)
                            Spacer()
                            if(task.isMyTask){
                                Image(systemName: "square.and.pencil")
                            }
                        }
                        
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
                            Text(
                                task.description
                            ) //task.description
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
//                            let formatter = DateFormatter()
//                            formatter.dateFormat = "dd MMM yyyy, h:mm a"
                            Image(systemName: "calendar")
                            Text(
                                task.date.formatted()
                            )
                            .fontWeight(.medium)
                        }
                        
                        Divider()
                            .padding(.vertical, 5)
                        
                        HStack {
                            Image(systemName: "creditcard")
//                            let price: String
//                            switch task.price {
//                            case .payment(let amount):
//                                price = "$\(amount)"
//                            case .reward(let rewardText):
//                                price = rewardText
//                            }
                            Text(task.price.associatedValue())
                        }
                        
                        Divider()
                            .padding(.vertical, 5)
                        
                        VStack(alignment: .leading) {
                            Text("Location")
                                .font(.footnote)
                                .foregroundColor(.textColor2)
                            Text(task.location)
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
                    
                }
                if task.isMyTask {
                    if task.taskStatus == .open {
                        PrimaryButton(
                            title: "View Offers",
                            action: { isOffersSheetShowing = true },
                            backgroundColor: .primaryBlue,
                            textColor: .white
                        )
                    } else {
                        let formattedStatus = task.taskStatus.rawValue
                            .replacingOccurrences(
                                of: "([a-z])([A-Z])",
                                with: "$1 $2",
                                options: .regularExpression
                            )
                            .capitalized
                        PrimaryButton(
                            title: formattedStatus,
                            action: { print("hey") },
                            backgroundColor: .primaryDark,
                            textColor: .white
                        )
                    }
                } else
                if task.taskStatus == .open {
                    NavigationLink(
                        destination: ConfirmationScreenView(
                            title: "You've made a request!",
                            description: "Please wait for the poster to review your profile and contact you for the next steps.",
                            buttonText: "View Your Task"
                        )
                    ) {
                        Text("Send a Request")
                            .padding()
                            .frame(
                                maxWidth: .infinity
                            ) // Make the button fill horizontally
                            .background(Color.primaryBlue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                } else {
                    PrimaryButton(
                        title: "Update Status",
                        action: {showStatusSheet = true },
                        backgroundColor: .primaryDark,
                        textColor: .white
                    )
                }
            }
            .padding()
            
        }.navigationTitle("Task Details")
            .sheet(isPresented: $isOffersSheetShowing){
                OffersView()
            }
            .sheet(isPresented: $showStatusSheet) {
                TaskStatusSheetView()
                    .presentationDetents([.fraction(CGFloat(0.45))])
                    .presentationDragIndicator(.visible)
            }
    }
    
    
    // else if (task.isCurrentTask) {
    //                     PrimaryButton(title: "Update Status") {
    //                         showStatusSheet = true
    
    //                     }
    //                 }
    
    
    
}

#Preview {
    TaskDetailView(
task: TaskModel(
        id: UUID(),
        posterID: UUID(),
        taskerID: nil,
        date: DateComponents(
            calendar: .current,
            year: 2025,
            month: 6,
            day: 1,
            hour: 10
        ).date!,
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
)
    )
}
