//
//  User.swift
//  Wejhuh
//
//  Created by Huda N S on 16/05/1443 AH.
//

import Foundation
import FirebaseFirestore


class UserApi {
    static func addUser(name:String,uid:String,email:String,completion: @escaping (Bool) -> Void) {
        let refUsers = Firestore.firestore().collection("Users")
        refUsers.document(uid).setData(User.CreateUser(likes: [], name: name, email: email))
        completion(true)
    }
    static func getUser(uid:String,completion: @escaping (User) -> Void) {
        let refUsers = Firestore.firestore().collection("Users")
        refUsers.document(uid).getDocument { document, error in
            if let document = document, document.exists {
                let user = User.getUser(dict: document.data()!)
                completion(user)
            }
        }
    }

    static func addLikes(uid:String,likes:[String]) {
        
        
        
        let refUsers = Firestore.firestore().collection("Users")
        refUsers.document(uid).setData(["likes":likes],merge: true)
    }
}
