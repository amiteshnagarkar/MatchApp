//
//  LoginViewController.swift
//  ProgressTracker
//
//  Created by Amitesh Nagarkar on 27/10/2019.
//  Copyright © 2019 Amitesh Nagarkar. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
     
    @IBOutlet weak var passwordTextField: UITextField!
    
     
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
        
    }
    
    
    func setUpElements() {
        
        //hide the error label
        
        //styles the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        //TODO: validate text fields
        
        //create cleaned versions of the textfieds
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        //signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                //couldnt sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
               
                let homeViewController =
                    self.storyboard?
                        .instantiateViewController(identifier:
                            Constants.Storyboard.homeViewController) as?
                HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
                  
            }
            }
            
        }
        
        
    }
    



