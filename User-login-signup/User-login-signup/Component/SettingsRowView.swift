//
//  SettingsRowView.swift
//  User-login-signup
//
//  Created by mohamdan on 28/12/2023.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName : String
    let title : String
    let tintColor : Color
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "version", tintColor: Color(.systemGray))
}
