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
    
    var profile : User?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var langaugeButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var usefulContactsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        langaugeButton.layer.shadowColor = UIColor.placeholderText.cgColor
        langaugeButton.layer.shadowOpacity = 10
        langaugeButton.layer.shadowOffset = .zero
        langaugeButton.layer.shadowRadius = 3
        langaugeButton.layer.cornerRadius = 8
        
        callButton.layer.shadowColor = UIColor.placeholderText.cgColor
        callButton.layer.shadowOpacity = 10
        callButton.layer.shadowOffset = .zero
        callButton.layer.shadowRadius = 3
        callButton.layer.cornerRadius = 8
        
        usefulContactsButton.layer.shadowColor = UIColor.placeholderText.cgColor
        usefulContactsButton.layer.shadowOpacity = 10
        usefulContactsButton.layer.shadowOffset = .zero
        usefulContactsButton.layer.shadowRadius = 3
        usefulContactsButton.layer.cornerRadius = 8
        

        
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
    
    
    // MARK: - language Button
    @IBAction func language(_ sender: Any) {
        let chengelangu = UIAlertController(title: NSLocalizedString("The application will be restarted".localaized, comment: ""), message: NSLocalizedString( "Choose your preferred language".localaized,comment: ""), preferredStyle: .actionSheet)
           chengelangu.addAction(UIAlertAction(title: "Einglish", style: .default, handler: { action in
             let currentlang = Locale.current.languageCode
             let newLanguage = currentlang == "en" ? "ar" : "en"
             UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
             exit(0)
           }))
           chengelangu.addAction(UIAlertAction(title: "عربي ", style: .default, handler: {action in
             let currentlang = Locale.current.languageCode
             let newLanguage = currentlang == "en" ? "ar" : "ar"
             UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
             exit(0)
           }))
           chengelangu.addAction(UIAlertAction(title:NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil))
           present(chengelangu, animated: true, completion: nil)
    }
    
    
    // MARK: - call Button
    @IBAction func call(_ sender: Any) {
        let myUrl = "tel://930"
              // or outside scope use this
              guard let url = URL(string: "\(myUrl)"), !url.absoluteString.isEmpty else { return }
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @IBAction func usefulContacts(_ sender: Any) {
        performSegue(withIdentifier: Segues.usefulContacts.rawValue, sender: nil)
    }
}
