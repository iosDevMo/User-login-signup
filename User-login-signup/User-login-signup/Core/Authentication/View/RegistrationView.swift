//
//  RegistrationView.swift
//  User-login-signup
//
//  Created by mohamdan on 27/12/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmpassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        VStack(spacing: 24){
            Spacer()
            VStack{
                // form fields
                InputView(text: $email, title: "Email Address", placeholder: "name @example.com")
                    .autocapitalization(.none)
                InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")
                
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmpassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                    if !password.isEmpty && !confirmpassword.isEmpty{
                        if confirmpassword == password {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        }else{
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
                
            }.padding(.horizontal)
            // signup button
            Button(action: {
                Task{
                    try await viewModel.creatUser(withemail:email, password:password, fullname:fullname)
                }
            }, label: {
                HStack {
                    Text("Sign Up")
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            })
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            Spacer()
            // signin button
            Button(action: {
                dismiss()
            }, label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            })
                
                
            

        }
    }
}
//MARK: - AuthenticationFormProtocol

extension RegistrationView : AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5 && confirmpassword == password && !fullname.isEmpty
    }
}
#Preview {
    RegistrationView()
}
