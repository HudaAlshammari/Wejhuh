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
    
    //eye icon password
    let button = UIButton(type: .custom)
    var btnColor = UIButton(type: .custom)
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        password.rightViewMode = .unlessEditing
        button.setImage(UIImage(named: "closeEye"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -5 , bottom: 5, right: 15)
        button.alpha = 1
        button.frame = CGRect(x: CGFloat(password.frame.size.width - 25), y: CGFloat(5), width: CGFloat(15), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.btnPasswordVisiblityClicked), for: .touchUpInside)
        password.rightView = button
        password.rightViewMode = .always
        let TapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
            view.addGestureRecognizer(TapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Confirm the existence of the account
        if Auth.auth().currentUser != nil {
           performSegue(withIdentifier: "toApp", sender: nil)
        }
    }
    
    //Function of the button to hide and show the password
    @IBAction func btnPasswordVisiblityClicked(_ sender: Any) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.password.isSecureTextEntry = false
            button.setImage(UIImage(named: "openEye"), for: .normal)
        } else {
            self.password.isSecureTextEntry = true
            button.setImage(UIImage(named: "closeEye"), for: .normal)
        }
    }
    
    
    //creat New Account Button
    @IBAction func creatAccount(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Signup")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    //Alert if the account has been created or not and if the data is filled out or not
    @IBAction func signIn(_ sender: UIButton) {
        if email.text?.isEmpty ?? true || password.text?.isEmpty ?? true {
            let alert = UIAlertController(title: "please full in Email and Password".localaized, message: "your email or passowrd is missing".localaized , preferredStyle: .alert)
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
                let alert = UIAlertController(title: "Error".localaized, message: "Sorry , we could not find your account.".localaized , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK" , style: .default , handler: nil))
                self?.present(alert, animated : true)
            } else {
                self?.performSegue(withIdentifier: Segues.toApp.rawValue, sender: nil)
            }
        }
    }
}
