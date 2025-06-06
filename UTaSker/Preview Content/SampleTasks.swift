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
        ),
        TaskModel(
            id: UUID(),
            posterID: UUID(),
            taskerID: nil,
            date: DateComponents(calendar: .current, year: 2025, month: 6, day: 1, hour: 11, minute: 30).date!,
            duration: "1 hour",
            title: "Bake Sale Help",
            description: "Assist with selling cupcakes and managing payments.",
            location: "Courtyard",
            iconName: "birthday.cake",
            price: .payment(10),
            category: .assistance,
            requirements: [.field("Friendly attitude"), .field("Basic math skills")],
            images: ["Home2"],
            taskStatus: .completed,
            isMyTask: false
        ),
        TaskModel(
            id: UUID(),
            posterID: UUID(),
            taskerID: nil,
            date: DateComponents(calendar: .current, year: 2025, month: 6, day: 1, hour: 13).date!,
            duration: "1 hour",
            title: "Language partner session",
            description: "Practice speaking English with an international student.",
            location: "Building 2",
            iconName: "person.2.fill",
            price: .payment(5),
            category: .academic,
            requirements: nil,
            images: ["Home3"],
            taskStatus: .open,
            isMyTask: true
        ),
        TaskModel(
            id: UUID(),
            posterID: UUID(),
            taskerID: nil,
            date: DateComponents(calendar: .current, year: 2025, month: 6, day: 2, hour: 12).date!,
            duration: "1 hour",
            title: "Club meeting cleanup",
            description: "Dispose of trash, wipe tables, and restore chairs.",
            location: "Room 105",
            iconName: "trash.fill",
            price: .reward("Free lunch voucher"),
            category: .labour,
            requirements: [.strong],
            images: ["Home2"],
            taskStatus: .open,
            isMyTask: true
        ),
        TaskModel(
            id: UUID(),
            posterID: UUID(),
            taskerID: nil,
            date: DateComponents(calendar: .current, year: 2025, month: 6, day: 2, hour: 15).date!,
            duration: "1 hour",
            title: "Dog walking for professor",
            description: "Walk a friendly golden retriever for 30 mins.",
            location: "Faculty Housing",
            iconName: "pawprint.fill",
            price: .payment(8),
            category: .assistance,
            requirements: [.field("Comfortable with dogs")],
            images: ["Home2"],
            taskStatus: .open,
            isMyTask: true
        ),
        TaskModel(
            id: UUID(),
            posterID: UUID(),
            taskerID: UUID(), // Assigned
            date: DateComponents(calendar: .current, year: 2025, month: 6, day: 3, hour: 9).date!,
            duration: "1 hour",
            title: "Assist during open day",
            description: "Guide new students and distribute flyers.",
            location: "Main Hall",
            iconName: "megaphone.fill",
            price: .payment(12),
            category: .assistance,
            requirements: [.field("Clear speaking voice")],
            images: ["Home2"],
            taskStatus: .ongoing,
            isMyTask: false
        ),
        TaskModel(
            id: UUID(),
            posterID: UUID(),
            taskerID: nil,
            date: DateComponents(calendar: .current, year: 2025, month: 6, day: 15, hour: 3).date!,
            duration: "1 hour",
            title: "Emergency food court rescue",
            description: "Rescue a trapped student in the food court. Warning: high caffeine exposure.",
            location: "Food Court",
            iconName: "exclamationmark.triangle.fill",
            price: .payment(100),
            category: .DUMMY,
            requirements: [.field("Rescue skills preferred")],
            images: ["Home2"],
            taskStatus: .ongoing,
            isMyTask: false
        )

    ]
}


//struct SampleTasks {
//    static let all: [TaskModel] = [
//        TaskModel(
//            date: "Fri 31 May",
//            time: "2 PM",
//            title: "Help set up chairs",
//            building: "Hall B",
//            distance: "100m",
//            description: "Assist in setting up chairs for the event in Hall B.",
//            iconName: "chair.lounge.fill",
//            price: "$5",
//            status: "Open",
//            isMyTask: true ,
//            images: ["Home1"],
//            isCurrentTask: false
//          
//        ),
//        TaskModel(
//            date: "Fri 31 May",
//            time: "3 PM",
//            title: "Library book sorting",
//            building: "Library",
//            distance: "80m",
//            description: "Organize books back onto the shelves in alphabetical order.",
//            iconName: "books.vertical",
//            price: "Free",
//            status: "Open",
//            isMyTask: true ,
//            images: ["Home2"],
//            isCurrentTask: false
//        ),
//        TaskModel(
//            date: "Fri 31 May",
//            time: "5 PM",
//            title: "Photography for event",
//            building: "Auditorium",
//            distance: "120m",
//            description: "Take photos for the marketing club’s workshop.",
//            iconName: "camera.fill",
//            price: "$15",
//            status: "Awaiting Review",
//            isMyTask: true ,
//            images: ["Home3"],
//            isCurrentTask: false
//        ),
//        TaskModel(
//            date: "Sat 1 Jun",
//            time: "10 AM",
//            title: "Tech booth setup",
//            building: "Building 6",
//            distance: "200m",
//            description: "Help with setting up tech booth cables and monitors.",
//            iconName: "desktopcomputer",
//            price: "$20",
//            status: "Pending",
//            isMyTask: false ,
//            images: ["Home1"],
//            isCurrentTask: false
//        ),
//        TaskModel(
//            date: "Sat 1 Jun",
//            time: "11:30 AM",
//            title: "Bake Sale Help",
//            building: "Courtyard",
//            distance: "50m",
//            description: "Assist with selling cupcakes and managing payments.",
//            iconName: "birthday.cake",
//            price: "$10",
//            status: "Completed",
//            isMyTask: false ,
//            images: ["Home2"],
//            isCurrentTask: false
//        ),
//        TaskModel(
//            date: "Sat 1 Jun",
//            time: "1 PM",
//            title: "Language partner session",
//            building: "Building 2",
//            distance: "150m",
//            description: "Practice speaking English with an international student.",
//            iconName: "person.2.fill",
//            price: "$5",
//            status: "Open",
//            isMyTask: false ,
//            images: ["Home3"],
//            isCurrentTask: false
//        ),
//        TaskModel(
//            date: "Sun 2 Jun",
//            time: "12 PM",
//            title: "Help clean up after club meeting",
//            building: "Room 105",
//            distance: "60m",
//            description: "Dispose of trash, wipe tables, and restore chairs.",
//            iconName: "trash.fill",
//            price: "Free",
//            status: "Open",
//            isMyTask: false ,
//            images: ["Home2"],
//          isCurrentTask: false
//        ),
//        TaskModel(
//            date: "Sun 2 Jun",
//            time: "3 PM",
//            title: "Dog walking for professor",
//            building: "Faculty Housing",
//            distance: "300m",
//            description: "Walk a friendly golden retriever for 30 mins.",
//            iconName: "pawprint.fill",
//            price: "$8",
//            status: "Open",
//            isMyTask: false ,
//            images: ["Home2"],
//            isCurrentTask: false
//        ),
//        TaskModel(
//            date: "Mon 3 Jun",
//            time: "9 AM",
//            title: "Assist during open day",
//            building: "Main Hall",
//            distance: "90m",
//            description: "Guide new students and distribute flyers.",
//            iconName: "megaphone.fill",
//            price: "$12",
//            status: "Open",
//            isMyTask: false ,
//            images: ["Home2"],
//            isCurrentTask: false
//        ),
//        TaskModel(
//            date: "Tue 15 Jun",
//            time: "3 AM",
//            title: "HELPPPPPPP",
//            building: "Food Court",
//            distance: "90m",
//            description: "I'M STUCK IN THE FOOD COURT. SOMEONE COME HELP ME PLEASE. JUST LET ME OUT. PLEASE OH MY GOD I'VE BEEN EATING CORN CHIPS AND SEAWEED AND I'VE BEEN DRINKING NOTHING BUT REDBULL. I'M GONNA DIE IN HERE.",
//            iconName: "megaphone.fill",
//            price: "$100",
//            status: "Ongoing",
//            isMyTask: false ,
//            images: ["Home2"],
//            isCurrentTask: false
//        )
//    ]
//}
