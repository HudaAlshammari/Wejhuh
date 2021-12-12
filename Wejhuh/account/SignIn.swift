//
//  SignIn.swift
//  Wejhuh
//
//  Created by Huda N S on 04/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth


class SignIn: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func creatAccount(_ sender: UIButton) {
//        performSegue(withIdentifier: "signup", sender: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signup")
        vc.modalPresentationStyle = .overFullScreen
        present(vc , animated: false)
    }
    
    
    @IBAction func signIn(_ sender: UIButton) {
        if email.text?.isEmpty ?? true || password.text?.isEmpty ?? true {
            let alert = UIAlertController(title: "please full in Email and Password", message: "your email or passowrd is missing" , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK" , style: .default , handler: nil))
            self.present(alert, animated : true)
        } else {
            signIn()
        }
    }
    
    
    func signIn(){
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, error in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: "Sorry , we could not find your account." , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK" , style: .default , handler: nil))
                self?.present(alert, animated : true)
            } else {
                self?.performSegue(withIdentifier: "toApp", sender: nil)
            }
            self!.checkUserInfo()
        }
}
    
    
    func checkUserInfo(){
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "signup")
//            vc.modalPresentationStyle = .overFullScreen
//            present(vc , animated: true)
        }
    }
}
