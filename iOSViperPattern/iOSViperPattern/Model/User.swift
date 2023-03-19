//
//  User.swift
//  iOSViperPattern
//
//  Created by Ahmed Amin on 19/03/2023.
//

import Foundation


struct User: Codable {
    
    var id: Int?
    var firstName: String?
    var lastName: String?
    var avatar: String?
    var creationDate: Int?
        
}

struct UserViewModel {
    
    let fullName: String
    let avatar: String
    let registrationDate: String
    
    let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD"
        return formatter
    }()
    
    init(user: User) {
        self.fullName = (user.firstName ?? "") + (user.lastName ?? "")
        self.avatar = user.avatar ?? ""
        self.registrationDate = dateFormatter.string(from: Date(timeIntervalSince1970: Double(user.creationDate ?? 0)))
    }
     
}
