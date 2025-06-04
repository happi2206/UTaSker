import SwiftUI

struct OffersView: View {
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
            
            VStack(alignment: .leading){
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                HStack(alignment: .center, spacing: 12) {
                    
                    
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
                        
                        HStack() {
                         
                            
                            NavigationLink(destination: OffersProfileView()) {
                                Text("View Profile")
                                    .font(
                                        .system(size: 14, weight: .medium)
                                    )
                                    .foregroundColor(.primaryBlue)
                                    .padding(.horizontal, 45)
                                    .padding(.vertical, 7)
                                    .fixedSize(
                                        horizontal: true,
                                        vertical: false
                                    )
                                    .background(.primaryLight)
                                    .cornerRadius(8)
                            }
                          
                                
                            
                           
                            Spacer()
                            NavigationLink(destination: OffersProfileView()) {
                                Text("Accept")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 45)
                                    .padding(.vertical, 7)
                                    .background(Color.blue)
                                    .fixedSize(
                                        horizontal: true,
                                        vertical: false
                                    )
                                    .cornerRadius(8)
                               
                            }
                            
                    

                            
                        }
              
                    }
                    
                    Spacer()
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    OffersView()
}
