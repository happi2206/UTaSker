import SwiftUI

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    HStack {
                        Button(action: {
                           
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Text("Create your profile")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Spacer()
                        
                        Image(systemName: "chevron.left")
                            .opacity(0)
                    }
                    .padding(.horizontal)

                    
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
                        StyledField(title: "First Name", placeholder: "First Name", text: $firstName)
                        StyledField(title: "Last Name", placeholder: "Last Name", text: $lastName)
                        StyledField(title: "Phone Number", placeholder: "04XXXXXXXX", text: $phoneNumber, keyboardType: .phonePad)
                        StyledField(title: "UTS Email Address", placeholder: "Firstname.lastname@student.uts.edu.au", text: $email, keyboardType: .emailAddress)
                        SecureStyledField(title: "Create a Password", placeholder: "Minimum 8 characters", text: $password)
                    }

                    
                    Button(action: {
                        
                    }) {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }

                    
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        Button("Sign In") {
                            
                        }
                        .font(.footnote)
                        .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .background(Color.white)
            .navigationBarHidden(true)
        }
    }
}

struct StyledField: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            (
                Text(title)
                    .foregroundColor(.black) +
                Text("*")
                    .foregroundColor(.red)
            )
            .font(.system(size: 14))
            .fontWeight(.semibold)

            TextField(placeholder, text: $text)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .keyboardType(keyboardType)
        }
    }
}

struct SecureStyledField: View {
    var title: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            (
                Text(title)
                    .foregroundColor(.black) +
                Text("*")
                    .foregroundColor(.red)
            )
            .font(.system(size: 14))
            .fontWeight(.semibold)

            SecureField(placeholder, text: $text)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }
    }
}


#Preview {
    SignUpView()
}

