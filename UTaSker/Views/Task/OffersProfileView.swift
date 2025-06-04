//
//  OffersProfileView.swift
//  UTaSker
//
//  Created by Happiness on 4/6/2025.
//



import SwiftUI

struct OffersProfileView: View {
    @Environment(\.dismiss) var dismiss

    @State private var isShowingConfirmationScreen = false
    
    var body: some View {
        
        if (isShowingConfirmationScreen){
            ConfirmationScreenView(
                title: "You've assigned Sophia to your task!",
                description: "They're ready to help you with...",
                buttonText: "Contact Sophia"
            )
        }
        else{
            NavigationStack{  ScrollView {
                VStack(spacing: 16) {
                    
               
                    
                    Text(
                        "Responded to I need someone to help me with my homework"
                    )
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.textColor2)
                    .padding(.horizontal)
                    
                    VStack(spacing: 3) {
                        Image("FemalePlaceholder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                        
                        Text("Sophia Carter")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.textColor1)
                        
                        Text("Student")
                            .foregroundColor(.textColor2)
                    }.padding(.top, 10)
                    
                    RatingsRow(
                        rating: 2,
                        numRatings: 100,
                        showRatingCount: true
                    )
                    
                    HStack(spacing: 10) {
                        ReviewBanner( text: "On Time")
                        ReviewBanner(text: "Attention to Detail")
                        ReviewBanner(text: "Fast Response")
                    }
                    
                    
                    ScrollView{
                        VStack (alignment: .leading) {
                            CustomTabView()
                        }
                    }.frame(height: 270)
                    
                    HStack{
                        PrimaryButton(
                            title: "Accept",
                            action: { isShowingConfirmationScreen = true },
                            backgroundColor: .primaryBlue,
                            textColor: .white,
                            
                        )
                        PrimaryButton(
                            title: "Decline",
                            action: { dismiss() },
                            backgroundColor: .primaryLight,
                            textColor: .primaryBlue,
                            
                        )
                    }.padding()
                    
                    
                    
                    
                    
                }
                .padding(.top)
            }
            
            }.navigationTitle("Sophia Carter made an offer")
        }
    }
}

 
 
#Preview {
    OffersProfileView()
}
