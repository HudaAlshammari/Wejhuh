//
//  Signup.swift
//  Wejhuh
//
//  Created by Huda N S on 04/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth


// MARK: - Signup
class Signup: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func signup(_ sender: Any) {
        if email.text?.isEmpty == true {
            print("pleas full Email")
            return
        }
        if password.text?.isEmpty == true {
            print("pleas full password")
            return
        }else{
            signup()
        }
    }
    
    //if the user have accaount - Button
    @IBAction func haveAccount(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Signin")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    //Auth for signUP
    func signup(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
            guard error == nil else {
                print("Error \(String(describing: error?.localizedDescription))")
                return
            }
            self.performSegue(withIdentifier: "toApp", sender: nil)
        }
    }
}
