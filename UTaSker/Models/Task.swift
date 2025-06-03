//
//  Task.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI

enum TaskCategory: String, CaseIterable {
    case Labour, Academic, Assistance
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
