//
//  LoginViewController.swift
//  instacatBrena
//
//  Created by mbtec22 on 11/21/19.
//  Copyright © 2019 Kevin Breña Huachin. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func loginClickButton(_ sender: Any) {
        
        print("Login button clicked")
        if(usernameTextField.text != "" && passwordTextField.text != "") {
            print(usernameTextField.text!)
            print(passwordTextField.text!)
            Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
                if(user != nil) {
                    print("User authenticated")
                    self.presentingViewController?.dismiss(animated: true, completion: nil)
                }else {
                    print("There was another error!!!")
                    self.errorLabel.isHidden = false
                }
            }
        }else {
            print("There was an error!")
            self.errorLabel.isHidden = false
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
