//
//  User.swift
//  Wejhuh
//
//  Created by Huda N S on 19/05/1443 AH.
//
import Foundation
import UIKit

extension User {
    
    static func getUser(dict: [String: Any]) -> User {
       
        let user = User()
        
        user.name = dict["name"] as? String
        user.email = dict["email"] as? String
        return user
    }
    
    static func CreateUser(name:String,email:String) -> [String: Any] {
       
        let newUser = ["name":name,
                       "email" :email
                    ] as [String : Any]
        
        return newUser
    }
}

