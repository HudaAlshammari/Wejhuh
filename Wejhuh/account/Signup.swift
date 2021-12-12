//
//  Signup.swift
//  Wejhuh
//
//  Created by Huda N S on 04/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

class Signup: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            signUP()
        }
        
        performSegue(withIdentifier: "toApp", sender: nil)
    }
    
    
    @IBAction func haveAccount(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signIn")
        vc.modalPresentationStyle = .overFullScreen
        signUP()
        present(vc , animated: false)
    }
    
    func signUP(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
        }
    }
    
}
