//
//  InputView.swift
//  User-login-signup
//
//  Created by mohamdan on 27/12/2023.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(Color(.darkGray))
            if isSecureField{
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            }else{
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            Divider()
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "email@example.com")
}
