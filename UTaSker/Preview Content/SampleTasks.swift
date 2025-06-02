//
//  SampleTasks.swift
//  UTaSker
//
//  Created by Happiness on 31/5/2025.
//



import Foundation

struct SampleTasks {
    static let all: [TaskModel] = [
        TaskModel(
            date: "Fri 31 May",
            time: "2 PM",
            title: "Help set up chairs",
            building: "Hall B",
            distance: "100m",
            description: "Assist in setting up chairs for the event in Hall B.",
            iconName: "chair.lounge.fill",
            price: "$5",
            images: ["Home1"]
        ),
        TaskModel(
            date: "Fri 31 May",
            time: "3 PM",
            title: "Library book sorting",
            building: "Library",
            distance: "80m",
            description: "Organize books back onto the shelves in alphabetical order.",
            iconName: "books.vertical",
            price: "Free",
            images: ["Home2"]
        ),
        TaskModel(
            date: "Fri 31 May",
            time: "5 PM",
            title: "Photography for event",
            building: "Auditorium",
            distance: "120m",
            description: "Take photos for the marketing club’s workshop.",
            iconName: "camera.fill",
            price: "$15",
            images: ["Home3"]
        ),
        TaskModel(
            date: "Sat 1 Jun",
            time: "10 AM",
            title: "Tech booth setup",
            building: "Building 6",
            distance: "200m",
            description: "Help with setting up tech booth cables and monitors.",
            iconName: "desktopcomputer",
            price: "$20",
            images: ["Home1"]
        ),
        TaskModel(
            date: "Sat 1 Jun",
            time: "11:30 AM",
            title: "Bake Sale Help",
            building: "Courtyard",
            distance: "50m",
            description: "Assist with selling cupcakes and managing payments.",
            iconName: "cupcake",
            price: "$10",
            images: ["Home2"]
        ),
        TaskModel(
            date: "Sat 1 Jun",
            time: "1 PM",
            title: "Language partner session",
            building: "Building 2",
            distance: "150m",
            description: "Practice speaking English with an international student.",
            iconName: "person.2.fill",
            price: "$5",
            images: ["Home3"]
        ),
        TaskModel(
            date: "Sun 2 Jun",
            time: "12 PM",
            title: "Help clean up after club meeting",
            building: "Room 105",
            distance: "60m",
            description: "Dispose of trash, wipe tables, and restore chairs.",
            iconName: "trash.fill",
            price: "Free",
            images: ["Home2"]
        ),
        TaskModel(
            date: "Sun 2 Jun",
            time: "3 PM",
            title: "Dog walking for professor",
            building: "Faculty Housing",
            distance: "300m",
            description: "Walk a friendly golden retriever for 30 mins.",
            iconName: "pawprint.fill",
            price: "$8",
            images: ["Home2"]
        ),
        TaskModel(
            date: "Mon 3 Jun",
            time: "9 AM",
            title: "Assist during open day",
            building: "Main Hall",
            distance: "90m",
            description: "Guide new students and distribute flyers.",
            iconName: "megaphone.fill",
            price: "$12",
            images: ["Home2"]
        )
    ]
}
