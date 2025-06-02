//
//  TaskFormView.swift
//  UTaSker
//
//  Created by Happiness on 2/6/2025.
//

import SwiftUI

struct TaskFormView: View {
    @State private var currentStep = 0
    @State private var title = ""
    @State private var date = Date()
    @State private var selectedLocation = "In person"
    @State private var notes: String = ""
    
    let totalSteps = 5

    var body: some View {
        VStack(spacing: 20) {
        
            HStack(spacing: 8) {
                ForEach(0..<totalSteps, id: \.self) { index in
                    Circle()
                        .fill(
                            index == currentStep ? Color.blue : Color.gray
                                .opacity(0.3)
                        )
                        .frame(width: 8, height: 8)
                }
                Spacer()
            }

  
 

   
            VStack(spacing: 16) {
                switch currentStep {
                case 0:
                    VStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Start with a title")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            
                            TextField(
                                "Task title (10 - 70 characters)",
                                text: $title
                            )
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            
                            Text("\(title.count)/70")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("When?")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            DatePicker(
                                selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/,
                                label: { Text("Pick a good time")
                                })
                            .font(.footnote)
                        }.padding(.vertical)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Location").font(.subheadline)
                                .fontWeight(.medium)

                            ForEach(
                                ["In person", "Online"],
                                id: \.self
                            ) { option in
                                HStack {
                                    Text(option)
                                    Spacer()
                                    Image(
                                        systemName: selectedLocation == option ? "largecircle.fill.circle" : "circle"
                                    )
                                    .foregroundColor(.blue)
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedLocation = option
                                }
                            }
                        }
                    }


                case 1:
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Describe your task")
                            .font(.subheadline)
                            .fontWeight(.medium)

                        TextEditor(text: $notes)
                            .frame(height: 120)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .scrollContentBackground(.hidden)
                            .background(Color(.systemGray6))

                        Text("Maximum 2000 characters")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }


                case 2:
                    UploadPhotosView()
                     
                case 3:
                    VStack(alignment: .leading, spacing: 6) {
                        Text("How would you pay?")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        TextField(
                            "$10.00",
                            text: $title
                        )
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        
                        Text("Or offer something else")
                            .font(.subheadline)
                            .fontWeight(.medium).padding(.top, 10)
                        
                        
                        ScrollView {  HStack(spacing: 7){
                        
                            TagView(text: "Voucher")
                            TagView(text: "Recommendation")
                            TagView(text: "Other")
                               
                        }
                        }
                    }
                    
                case 4:
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Preview Post")
                            .font(.title2)
                            .fontWeight(.medium)
                        ScrollView {
                            PreviewCardView(label: "Task Title", text: "Math help")
                            PreviewCardView(label: "Date and time", text: "11th June, 10:00 am")
                            PreviewCardView(label: "Task description", text: "I need someone to help me with my math homework")
                            PreviewCardView(label: "Location", text: "Online")
                            PreviewCardView(label: "Price", text: "$10.00")
                            
                            
                         
                        }
                    }
                    
                default:
                    Text("soon...")
                }
            }.padding(.top, 30)

            Spacer()

            
            PrimaryButton(
                title: "Continue",
                action: {   if currentStep < totalSteps - 1 {
                    currentStep += 1
                } else {
                   
                }},
                backgroundColor: .primaryBlue,
                textColor: .white,
             
            )
          
        }
        .padding(.horizontal)
        .presentationDetents([.medium, .large])
    }
}



struct TagView: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.blue.opacity(0.1))
            .multilineTextAlignment(.center)
            .cornerRadius(10)
    }
}


struct PreviewCardView: View { 
    let label: String
    let text: String

    var body: some View {
        HStack(spacing: 7){
            VStack (alignment: .leading, spacing: 8){
                VStack(alignment: .leading){
                    Text(label)
                        .foregroundColor(.textColor1)
                        .font(.body)
                    Text(text)
                        .foregroundColor(.textColor2)
                        .font(.subheadline)
                }
            }
            Spacer()
        }.padding(.top, 10)
    }
}
