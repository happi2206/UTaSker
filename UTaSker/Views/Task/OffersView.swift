//
//  OffersView.swift
//  UTaSker
//
//  Created by Priyanka  Chhabaria on 2/6/2025.
//
import SwiftUI

struct OffersView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Offers (3)")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.top)

                ScrollView {
                    VStack(spacing: 16) {
                        OfferCard(name: "John Doe", role: "Student", reviews: 24, imageName: "MalePlaceholder")
                        OfferCard(name: "Kevin Hart", role: "Student", reviews: 34, imageName: "MalePlaceholder")
                        OfferCard(name: "Sophia Carter", role: "Student", reviews: 24, imageName: "FemalePlaceholder")
                    }
                    .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // handle back
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct OfferCard: View {
    var name: String
    var role: String
    var reviews: Int
    var imageName: String
    

    var body: some View {
        
        HStack(alignment: .top, spacing: 16) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding()
           

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                Text(role)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("5.0")
                    Text("(\(reviews) Reviews)")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }

                HStack {
                    Button("Accept") {
                        
                    }
                    .foregroundColor(.white)
                    
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .cornerRadius(8)


                    Button("Decline") {
                        
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                }
                .padding(.top, 8)
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    OffersView()
}
