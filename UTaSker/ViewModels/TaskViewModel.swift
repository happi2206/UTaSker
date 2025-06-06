//
//  TaskViewModel.swift
//  UTaSker
//
//  Created by Happiness on 30/5/2025.
//



import Foundation
import FirebaseFirestore

struct TaskItem: Identifiable {
    var id: String
    var title: String
    var description: String
    var location: String
    var dueDate: Date
    var createdAt: Date
}

@MainActor
class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let db = Firestore.firestore()
    
    func fetchTasks() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let snapshot = try await db.collection("tasks").order(by: "createdAt", descending: true).getDocuments()
            
            var fetchedTasks: [TaskItem] = []
            
            for doc in snapshot.documents {
                let data = doc.data()
                
                guard
                    let title = data["title"] as? String,
                    let description = data["description"] as? String,
                    let location = data["location"] as? String,
                    let dueTimestamp = data["dueDate"] as? Timestamp,
                    let createdTimestamp = data["createdAt"] as? Timestamp
                else {
                    print("Invalid data for task with id: \(doc.documentID)")
                    continue
                }
                
                let task = TaskItem(
                    id: doc.documentID,
                    title: title,
                    description: description,
                    location: location,
                    dueDate: dueTimestamp.dateValue(),
                    createdAt: createdTimestamp.dateValue()
                )
                fetchedTasks.append(task)
            }
            
            tasks = fetchedTasks
            
        } catch {
            errorMessage = "Failed to fetch tasks: \(error.localizedDescription)"
            print("Error fetching tasks:", error)
        }
        
        isLoading = false
    }
}
