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
    
    //eye icon password
    let button = UIButton(type: .custom)
    var btnColor = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.rightViewMode = .unlessEditing
        
        button.setImage(UIImage(named: "closeEye"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -5 , bottom: 5, right: 15)
        button.alpha = 5
        button.frame = CGRect(x: CGFloat(password.frame.size.width - 25), y: CGFloat(5), width: CGFloat(15), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.btnPasswordVisiblityClicked), for: .touchUpInside)
        password.rightView = button
        password.rightViewMode = .always
        
        let TapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
            view.addGestureRecognizer(TapGesture)
        }
   
    
    //Function of the button to hide and display the password
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

    
    //button signup
    @IBAction func signup(_ sender: Any) {
        if email.text?.isEmpty == true || password.text?.isEmpty == true || name.text?.isEmpty == true {
            let alert = UIAlertController(title: "please full in Email and Password", message: "your name or email or passowrd is missing" , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK" , style: .default , handler: nil))
            self.present(alert, animated : true)
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
            if let error = error {
                let alert = UIAlertController(title: "Error", message: "The email address is incorrect or is already in use by another account." , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK" , style: .default , handler: nil))
                self.present(alert, animated : true)
                
                print(error.localizedDescription)
            }else{
                UserApi.addUser(name: self.name.text ?? "" , uid: authResult?.user.uid ?? "" , email: self.email.text ?? "" , completion: { check in
                    if check {
                        print(".....")
                        self.performSegue(withIdentifier: "toApp", sender: nil)
                    }
                })
            }
            guard error == nil else {
                print("Error \(String(describing: error?.localizedDescription))")
                return
            }
        }
    }
}
