//
//  LoginView.swift
//  User-login-signup
//
//  Created by mohamdan on 27/12/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel

    var body: some View {
        NavigationStack{
            VStack(spacing: 24){
                Spacer()
                VStack{
                    //form fields
                    InputView(text: $email, title: "Email Address", placeholder: "name @example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    
                }.padding(.horizontal)
                //signin button
                Button(action: {
                    Task{
                        try await viewModel.signIn(withemail: email, password: password)
                    }
                }, label: {
                    HStack {
                        Text("Sign In")
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
                //signup button
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        Text("Sign UP")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }

            }
        }
    }
}
//MARK: - AuthenticationFormProtocol

extension LoginView : AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
}

#Preview {
    LoginView()
}
