

//
//  AcceptOfferPreview.swift
//  UTaSker
//
//  Created by Jirapat Sivamard on 4/6/2025.
//

import SwiftUI

struct AcceptOfferPreviewView: View {
  
    
    
    var usersName: String
    @Environment(\.dismiss) var dismiss

    @State private var isShowingConfirmationScreen = false
    
    var body: some View {
        if (isShowingConfirmationScreen){ ConfirmationScreenView(title: "You've assigned Sophia to your task!", description: "They're ready to help you with...", buttonText: "Contact Sophia")}
        
        else{
            NavigationStack {
                VStack(spacing: 20) {
                    // Header
                 
                    
                    HStack {
                        Image("FemalePlaceholder")
                            .resizable()
                            .frame(maxWidth: 50, maxHeight: 50)
                            .scaledToFit()
                        
                        VStack(alignment: .leading) {
                            Text(usersName)
                                .font(.subheadline)
                                .foregroundColor(.textColor1)
                                .fontWeight(.medium)
                            Text("task description of task.")
                                .font(.footnote)
                                .foregroundColor(.textColor2)
                                .lineLimit(2)
                            
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // Summary Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Summary")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        VStack(spacing: 12) {
                            // Task Price
                            HStack {
                                Text("Task Price")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("$30")
                            }
                            
                            // Connection Fee
                            HStack {
                                Text("Connection Fee (1%)")
                                    .foregroundColor(.gray)
                                
                                Button(action: {
                                    // Show connection fee info
                                }) {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                Text("$0.03")
                            }
                            
                            Divider()
                            
                            // Total Price
                            HStack {
                                Text("Total Price")
                                    .fontWeight(.semibold)
                                Spacer()
                                
                                Text("$30.3")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                    
                    // Payment Method Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Payment Method")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Button(action: {
                            // Add payment method action
                        }) {
                            HStack {
                                Image(systemName: "creditcard")
                                    .foregroundColor(.primary)
                                Text("Add credit or debit card")
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    // Terms and Confirm Button
                    VStack(spacing: 16) {
                        Text("Deposit will be securely held by UTASKER until you release it to the Tasker.")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Button(action: {
                            // Handle terms action
                        }) {
                            Text("Terms & Conditions")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                        
                        Button(action: {
                            isShowingConfirmationScreen = true
                        }) {
                            Text("Confirm")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
                .background(Color(.systemGray6))
              
            }
            .navigationTitle("Accept Offer")
            
        }
    }
}

// Offer Model
struct Offer: Identifiable {
    let id = UUID()
    let userName: String
    let taskTitle: String
    let taskPrice: Double
}

#Preview {
    AcceptOfferPreviewView(usersName: "Sophia")
}
