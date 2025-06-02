//
//  Task.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//

import SwiftUI

struct TaskModel: Identifiable {
    let id = UUID()
    let date: String
    let time: String
    let title: String
    let building: String
    let distance: String
    let description: String
    let iconName: String
    let price: String
    let images: [String]?
    let status: String
    let isMyTask: Bool

   
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
        images: [String]? = nil
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
    }
}
