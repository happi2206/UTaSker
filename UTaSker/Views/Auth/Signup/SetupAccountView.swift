import SwiftUI
import FirebaseAuth

struct SetupAccountView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        ZStack(alignment: .bottomTrailing) {
                            Circle()
                                .fill(Color(.systemGray5))
                                .frame(width: 180, height: 180)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.black)
                                        .padding(25)
                                )
                            Circle()
                                .fill(Color(.systemGray5))
                                .frame(width: 32, height: 32)
                                .overlay(
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                )
                                .offset(x: -5, y: -5)
                        }
                        Spacer()
                    }
                    

                    // Form Fields
                    Group {
                        StyledField(
                            title: "First Name",
                            placeholder: "First Name",
                            text: $firstName
                        )
                        StyledField(
                            title: "Last Name",
                            placeholder: "Last Name",
                            text: $lastName
                        )
                        StyledField(
                            title: "Phone Number",
                            placeholder: "04XXXXXXXX",
                            text: $phoneNumber,
                            keyboardType: .phonePad
                        )
                 
                    }

                    
                    PrimaryButton(
                        title: isLoading ? "Saving..." : "Save",
                        action: {
                            guard let user = Auth.auth().currentUser else {
                                return
                            }
                            isLoading = true


                            let profile = UserProfile(
                                uid: user.uid,
                                firstName: firstName,
                                lastName: lastName,
                                phoneNumber: phoneNumber,
                                email: user.email ?? "",
                             
                                
                            )

                            FirestoreService.shared
                                .saveUserProfile(profile) { result in
                                    isLoading = false
                                    switch result {
                                    case .success:
                                        print("User profile saved.")
                                        authViewModel.needsProfileSetup = false
                                        authViewModel.isSignedIn = true
                                     
                                    case .failure(let error):
                                        print(
                                            "Error saving profile: \(error.localizedDescription)"
                                        )
                                    }
                                }
                        },
                        isDisabled: firstName.isEmpty || lastName.isEmpty || phoneNumber.isEmpty
                    )
                    .padding(.top)


                    
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        Button("Create your account") {
                            
                        }
                        .font(.footnote)
                        .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .background(Color.white)
           
       
        } .navigationTitle("Create your profile")
    }
}


#Preview {
    SetupAccountView()
}

