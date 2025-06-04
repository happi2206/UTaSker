//
//  Task.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI

enum TaskCategory: String, CaseIterable {
    case labour, academic, assistance
}

enum Price {
    case payment(Int), reward(String)
}

enum TaskRequirement {
    case strong, field(String)
}

enum TaskOpenStatus: String, CaseIterable {
    case open, pending, ongoing, awaitingReview, completed, cancelled
}

struct TaskModel: Identifiable {
    let id = UUID()
    let date: String
    let time: String
    let title: String
    let building: String        // Task building should be expanded into location. What room in the building? What if its not in a building but still on campus? Should just be "Location" -Ashton
    let distance: String
    let description: String
    let iconName: String
    let price: String
    let images: [String]?
    let status: String
    let isMyTask: Bool
    let isCurrentTask: Bool     // Task bools of isMyTask and isCurrentTask could be reduced into a single enum. Alternatively, when we set up user login and profiles there could be an ownerID variable which would be used in comparison for whoever is logged in, and an assignedTaskerID variable -Ashton
    // e.g if (ownerID == loggedInUserID) then show the editable view -Ashton
    // else if (assignedTaskerID == loggedInUserID) then show the TaskUpdateStatus version -Ashton
    // else show the taskApply version -Ashton
    // Task variable: "category" should be added; Enum already been made, if you can think of any categories feel free to add -Ashton

   
    init(
        date: String,
        time: String,
        title: String,
        building: String,
        distance: String,
        description: String,
        iconName: String,
        price: String,
        status: String,
        isMyTask: Bool,
        images: [String]? = nil,
        isCurrentTask: Bool
    ) {
        self.date = date
        self.time = time
        self.title = title
        self.building = building
        self.distance = distance
        self.description = description
        self.iconName = iconName
        self.price = price
        self.images = images
        self.status = status
        self.isMyTask = isMyTask
        self.isCurrentTask = isCurrentTask
    }
}

struct NewTaskModel: Identifiable {
    @State private(set) var id: UUID
    @State private(set) var posterID: UUID                  // id of the poster; might not be the best way to do this?
    @State var taskerID: UUID?                              // id of the assigned tasker. can be null; might not be the best way to do this?
    @State private(set) var date: Date
    @State private(set) var title: String
    @State private(set) var description: String
    @State private(set) var location: String                // might set up another custom structure for location. e.g they select building or exterior location. they select building floor and room, if any.
    @State private(set) var distance: Int
    @State private(set) var iconName: String
    @State private(set) var price: Price
    @State private(set) var category: TaskCategory
    @State private(set) var requirements: [TaskRequirement]? // array of requirements. can be null in the case of no requirements
    @State private(set) var images: [String]?
    @State private(set) var taskStatus: TaskOpenStatus
    
    init(id: UUID, posterID: UUID, date: Date, title: String, description: String, location: String, distance: Int, iconName: String, price: Price, category: TaskCategory, requirements: [TaskRequirement]? = nil, images: [String]? = nil, taskStatus: TaskOpenStatus) {
        self.id = id
        self.posterID = posterID
        self.taskerID = nil         // no assignment of taskerID, as a task won't start with any tasker
        self.date = date
        self.title = title
        self.description = description
        self.location = location
        self.distance = distance
        self.iconName = iconName
        self.price = price
        self.category = category
        self.requirements = requirements
        self.images = images
        self.taskStatus = taskStatus
    }
   
}
