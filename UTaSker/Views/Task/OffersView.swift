import SwiftUI

struct OffersView: View {
    @Environment(\.dismiss) var dismiss

    @State private var isShowingConfirmationScreen = false

    var body: some View {
        if (isShowingConfirmationScreen){ ConfirmationScreenView(title: "You've assigned Sophia to your task!", description: "They're ready to help you with...", buttonText: "Contact Sophia")}
        
        else{
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Offers (3)")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Spacer()

                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding(.trailing, 8)
                    }
                }
                .padding()

                ScrollView {
                    VStack(spacing: 16) {
                        OfferCard(
                            name: "John Doe",
                            role: "Student",
                            reviews: 24,
                            imageName: "MalePlaceholder",
                            isShowingConfirmationScreen: $isShowingConfirmationScreen
                           
                        )
                        OfferCard(
                            name: "Kevin Hart",
                            role: "Student",
                            reviews: 34,
                            imageName: "MalePlaceholder",
                            isShowingConfirmationScreen: $isShowingConfirmationScreen
                   
                        )
                        OfferCard(
                            name: "Sophia Carter",
                            role: "Student",
                            reviews: 24,
                            imageName: "FemalePlaceholder",
                            isShowingConfirmationScreen: $isShowingConfirmationScreen
                       
                        )
                    }
                    .padding()
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
        
        @Binding var isShowingConfirmationScreen: Bool
        
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
                    
                    HStack(spacing: 2) {
                        ForEach(0..<5, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 12))
                        }
                        Text("(\(reviews))")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                    HStack(spacing: 12) {
                        Button {
                            isShowingConfirmationScreen = true
                        } label: {
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
}
