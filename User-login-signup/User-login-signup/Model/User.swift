//
//  User.swift
//  User-login-signup
//
//  Created by mohamdan on 28/12/2023.
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    let fullName: String
    let email: String
    
    var initial: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
extension User {
   static var Mock_User = User(id: NSUUID().uuidString, fullName: "Ali Zaid", email: "example@gmail.com")
}
