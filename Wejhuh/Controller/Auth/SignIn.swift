//
//  SignIn.swift
//  Wejhuh
//
//  Created by Huda N S on 04/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth


// MARK: - Signin
class SignIn: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
           performSegue(withIdentifier: "toApp", sender: nil)
        }
    }
    //creat New Account Button
    @IBAction func creatAccount(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Signup")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
//        performSegue(withIdentifier: "toSignup", sender: nil)
    }
    
    //Alert if the account has been created or not
    @IBAction func signIn(_ sender: UIButton) {
        if email.text?.isEmpty ?? true || password.text?.isEmpty ?? true {
            let alert = UIAlertController(title: "please full in Email and Password", message: "your email or passowrd is missing" , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK" , style: .default , handler: nil))
            self.present(alert, animated : true)
        } else {
            signIn()
        }
    }
    
    //Auth for signIn
    func signIn(){
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "Sorry , we could not find your account." , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK" , style: .default , handler: nil))
                self?.present(alert, animated : true)
            } else {
                self?.performSegue(withIdentifier: "toApp", sender: nil)
            }
        }
    }
}
