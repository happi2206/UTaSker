//
//  ConfirmationScreen.swift
//  UTaSker
//
//  Created by Jirapat Sivamard on 3/6/2025.
//

import SwiftUI

struct ConfirmationScreenView: View {
    var title: String = "You've made a request!"
    var description: String = "Your task has been requested. We will contact you soon."
    var buttonText: String = "View Your Task"
    @Environment(\.dismiss) var dismiss
 
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        Spacer()
                        Text("Task Requested")
                            .font(.headline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .padding(.top, 8)
                            .padding(.horizontal, 80)
                        
                        
                        Button(action: {
                            dismiss()
            
    
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .padding(.trailing, 8)
                        }
                      
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    
                    
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.green)
                        .padding(.bottom, 20)
                    
                    
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 8)
                    
                    
                    Text(description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    
                    Spacer()
                    
                    
                    PrimaryButton(
                        title: buttonText,
                        action: {
                            print("View your Task tapped")
                        },
                        backgroundColor: .primaryDark,
                        textColor: .white,
                        cornerRadius: 10
                    )
                    .padding(.horizontal, 30)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
    


