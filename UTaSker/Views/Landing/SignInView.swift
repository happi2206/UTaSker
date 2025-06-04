//
//  LoginView.swift
//  UTaSker
//
//  Created by Ashton King on 4/6/2025.
//

import SwiftUI

private enum Field {
    case email, password
}
struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var signInDisabled: Bool = true
    @FocusState private var focusField: Field?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sign In")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.textColor1)
                VStack {
                    Image("UTaskerLogo")
                        .resizable()
                        .scaledToFit()
                        //.frame(width: 325)
                    
                    VStack(alignment: .leading) {
                        Text("UTS Email Address")
                        TextField("\("firstname.lastname@student.uts.edu.au")", text: $email)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                            .submitLabel(.next)
                            
                            .padding(6)
                            .focused($focusField, equals: .email)
                            .onSubmit {
                                focusField = .password
                            }
                            .onChange(of: email) { oldValue, newValue in
                                CheckValidSignIn()
                            }
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                        SecureField("Minimum 8 characters", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .submitLabel(.done)
                            .padding(6)
                            .focused($focusField, equals: .password)
                            .onSubmit {
                                focusField = nil
                            }
                            .onChange(of: password) {oldValue, newValue in
                            CheckValidSignIn()
                            }
                    }
                    .padding(.bottom)
                    
                    Spacer()
                    PrimaryButton(
                        title: "Sign In",
                        action: { print("WAHA") },
                        //backgroundColor: .blue,
                        //textColor: .white
                        isDisabled: signInDisabled
                    )
                }
                .padding()
            }
            .padding()
        }
    }
    
    func CheckValidSignIn() {
        //TODO: Makes these proper checks for existing emails and passwords.
        let goodEmail: Bool = email.count > 6 && email.contains("@")
        let goodPassword: Bool = password.count >= 8
        signInDisabled = !(goodEmail && goodPassword)
    }
    
}



#Preview {
    SignInView()
}
