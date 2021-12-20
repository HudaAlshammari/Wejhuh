//
//  LogOutVC.swift
//  Wejhuh
//
//  Created by Huda N S on 10/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth


// MARK: - Profile
class Profile: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var email: UILabel!
    
    

    
    var profile : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - logOut Button
    @IBAction func logOut(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
           self.dismiss(animated: true, completion: nil)
       } catch let signOutError as NSError {
         print("Error signing out: %@", signOutError)
       }
    }
}


class User {
    var name : String
    var email : String
}
