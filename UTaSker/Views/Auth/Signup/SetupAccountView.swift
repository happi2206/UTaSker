import SwiftUI
import FirebaseAuth
import FirebaseStorage


struct SetupAccountView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var isLoading = false
    @State private var imgName = ""
    @State private var bio = ""
    
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false

    
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
                                    Group {
                                        if let selectedImage = selectedImage {
                                            Image(uiImage: selectedImage)
                                                .resizable()
                                                .scaledToFill()
                                        } else {
                                            Image(systemName: "person.fill")
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                                .scaledToFit()
                                                .foregroundColor(.black)
                                                .padding(25)
                                        }
                                    }
                                        .clipShape(Circle())
                                )
                                .onTapGesture {
                                    showImagePicker = true
                                }

                            Circle()
                                .fill(Color(.systemGray5))
                                .frame(width: 32, height: 32)
                                .overlay(
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                )
                                .offset(x: -5, y: -5)
                                .padding()
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
                        StyledField(
                            title: "Bio",
                            placeholder: "Enter details about yourself",
                            text: $bio
                        )
                 
                    }

                    
                    PrimaryButton(
                        title: isLoading ? "Saving..." : "Save",
                        action: {
                            isLoading = true
                            authViewModel.saveProfile(
                                firstName: firstName,
                                lastName: lastName,
                                phoneNumber: phoneNumber,
                                selectedImage: selectedImage,
                                bio: bio
                            ) { result in
                                isLoading = false
                                if case .failure(let error) = result {
                                    print("Error: \(error.localizedDescription)")
                                }
                            }
                        },
                        isDisabled: firstName.isEmpty || lastName.isEmpty || phoneNumber.isEmpty,
                        isLoading: isLoading
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
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }

    }
}




#Preview {
    SetupAccountView()
}

