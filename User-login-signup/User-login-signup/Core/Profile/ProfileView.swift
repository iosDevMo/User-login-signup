//
//  ProfileView.swift
//  User-login-signup
//
//  Created by mohamdan on 27/12/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser{
            List {
                Section{
                    HStack{
                        Text(user.initial)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Section("General"){
                    HStack {
                        SettingsRowView(imageName: "gear", title: "version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                Section("Account"){
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Signout", tintColor: .red)
                    })
                    Button(action: {
                        print("delete account..")
                    }, label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    })
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
