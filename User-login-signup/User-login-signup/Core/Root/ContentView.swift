//
//  ContentView.swift
//  User-login-signup
//
//  Created by mohamdan on 27/12/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ProfileView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
