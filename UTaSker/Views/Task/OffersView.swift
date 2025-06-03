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
                        Image(systemName: "arrow.left")
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
        HStack(alignment: .center, spacing: 12) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 55, height: 55)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 6) {
                Text(name)
                    .font(.system(size: 16, weight: .semibold))

                Text(role)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)

                // 5 yellow stars in a row
                HStack(spacing: 2) {
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 12))
                    }
                    Text("(\(reviews))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }

                // Accept and Decline buttons
                HStack(spacing: 12) {
                    Button(action: {}) {
                        Text("Accept")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 35)
                            .padding(.vertical, 7)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }

                    Button(action: {}) {
                        Text("Decline")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.black)
                            .padding(.horizontal, 35)
                            .padding(.vertical, 7)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
                .padding(.top, 4)
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    OffersView()
}
