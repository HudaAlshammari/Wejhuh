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
    

    @IBOutlet weak var languageButton: UIButton!
    
    
    var profile : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languageButton.layer.shadowColor = UIColor.placeholderText.cgColor
        languageButton.layer.shadowOpacity = 1
        languageButton.layer.shadowOffset = .zero
        languageButton.layer.shadowRadius = 1
        
        

        
        // for save certain data on the Internet
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") {profile in
            self.profile = profile
            self.name.text = profile.name
            self.email.text = profile.email
        }
        if Auth.auth().currentUser?.uid == nil {
        }else{
        }
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
