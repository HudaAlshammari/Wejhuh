//
//  LogOutVC.swift
//  Wejhuh
//
//  Created by Huda N S on 10/05/1443 AH.
//

import UIKit
import Firebase


// MARK: - LogOut
class LogOutVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //LogOut Button
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
