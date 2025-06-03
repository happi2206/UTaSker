//
//  TaskStatusSheetView.swift
//  UTaSker
//
//  Created by Ashton King on 3/6/2025.
//

import SwiftUI

enum CurrentTaskStatus: String, CaseIterable {
    case Waiting, InProgress, Complete
}

struct TaskStatusSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State var status: CurrentTaskStatus = .Waiting
    @State var showStatus = false
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Text("Status")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .offset(x: 26)
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .padding(.horizontal)
                }
                
            }
            .padding(.bottom)
            VStack {
                HStack(spacing: 0) {
                    switch (status) {
                    case (.Waiting):
                        StatusCurrentCircle()
                        VStack {
                            StatusUpcomingRectangle()
                        }
                        StatusUpcomingCircle()
                        VStack {
                            StatusUpcomingRectangle()
                        }
                        StatusUpcomingCircle()
                    case (.InProgress):
                        StatusCompleteCircle()
                        VStack {
                            StatusCompleteRectangle()
                        }
                        StatusCurrentCircle()
                        VStack {
                            StatusUpcomingRectangle()
                        }
                        StatusUpcomingCircle()
                    case (.Complete):
                        StatusCompleteCircle()
                        VStack {
                            StatusCompleteRectangle()
                        }
                        StatusCompleteCircle()
                        VStack {
                            StatusCompleteRectangle()
                        }
                        StatusCompleteCircle()
                    }
                    
                }
                
                HStack {
                    ForEach(CurrentTaskStatus.allCases, id: \.rawValue,) { item in
                        if (item == .InProgress)
                        {
                            Text("In Progress")
                                .font(.footnote)
                                .foregroundColor(.textColor2)
                        }
                        else {
                            Text(item.rawValue)
                                .font(.footnote)
                                .foregroundColor(.textColor2)
                        }
                        if (item != .Complete) {
                            Spacer()
                        }
                    }
                }
            }
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    switch (status) {
                    case (.Waiting):
                        Text("Waiting")
                            .foregroundStyle(.blue)
                        Text("Will begin the task soon")
                            .foregroundStyle(.textColor2)
                    case (.InProgress):
                        Text("In Progress")
                            .foregroundStyle(.blue)
                        Text("Currently doing the task")
                            .foregroundStyle(.textColor2)
                    case (.Complete):
                        Text("Complete")
                            .foregroundStyle(.blue)
                        Text("Awaiting review from Ethan")
                            .foregroundStyle(.textColor2)
                    }
                }
                Spacer()
            }
            Spacer()
            switch (status) {
            case (.Waiting):
                PrimaryButton(title: "Begin the Task") {
                    status = .InProgress
                }
            case (.InProgress):
                PrimaryButton(title: "Finish the Task") {
                    status = .Complete
                }
            case (.Complete):
                PrimaryButton(title: "Contact Ethan") {
                    print("BRING TO PROFILE")
                }
            }
        
        }
        .padding(25)
        
    }
}

struct StatusUpcomingCircle: View {
    var body: some View {
        Circle()
            .stroke(.gray, lineWidth: 1)
            .foregroundStyle(.gray)
            .frame(maxWidth: 50, maxHeight: 50)
    }
}

struct StatusCurrentCircle: View {
    var body: some View {
        Circle()
            .stroke(.blue, lineWidth: 1)
            .foregroundStyle(.gray)
            .frame(maxWidth: 50, maxHeight: 50)
            .overlay(
                Circle()
                    .foregroundStyle(.blue)
                    .frame(maxWidth: 12)
                    
            )
    }
}

struct StatusCompleteCircle: View {
    var body: some View {
        Circle()
            .foregroundStyle(.blue)
            .frame(maxWidth: 50, maxHeight: 50)
            .overlay(
                Image(systemName: "checkmark")
                    .resizable()
                    .colorInvert()
                    .frame(width: 17, height: 17)
            )
        
    }
}

struct StatusUpcomingRectangle: View {
    var body: some View{
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 1)
            .foregroundStyle(.gray)
    }
}

struct StatusCompleteRectangle: View {
    var body: some View{
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 1)
            .foregroundStyle(.blue)
    }
}

#Preview {
    TaskStatusSheetView()
}
