//
//  SignUpViewController.swift
//  ProgressTracker
//
//  Created by Amitesh Nagarkar on 27/10/2019.
//  Copyright © 2019 Amitesh Nagarkar. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
     @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    

    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpElements()
        
        
        
    }
    
    func setUpElements() {
        
        // hide the error label
        //TODO: this is not working, fix this!!! -->
        
        errorLabel.alpha = 0
        
    
        
        
        //Styles the elements in my view controller using the utilities.swift file
        
        Utilities.styleTextField(firstNameTextField)
        
        Utilities.styleTextField(lastNameTextField)
          
        Utilities.styleTextField(emailTextField)
        
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(signUpButton)
        
        
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //check the fields & validate that the data is correct. If everything is correct, this method returns nil therefore nothing. Otherwise, it returns the error message!!
    func validateFields() -> String? {
        
        //check that all fields are filled in and no fields are empty hence the use fo " "
        if firstNameTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" {
            
            
            return "Please fill in all fields"
        
        }
        
        //check if password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //password is not secure enough.
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
            
        }
        
          return nil
        
        }
    // functions that can used the program in the future..
    
    func showError(_ message:String) {
           
           errorLabel.text = message
           errorLabel.alpha = 1
    
       }
    
    func transitionToHome(){
        
        let homeViewController =
        storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as?
        HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
}
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        // validate the fields
        
        let error = validateFields()
        
        if error != nil {
            
            showError (error!)
          
            
           
        
        }
        
        else {
            
            // create cleaned versions of the data aka strip out all white spaces and new lines from text feilds.
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
        
            
            // create the user
           Auth.auth ().createUser(withEmail: email,  password: password ) { (result, err) in
            
            
                
                //check for errors
                if err != nil {
                    
                    //there was an error creating the user
                    //err.showError ("Error creating user")
                    
                    //TODO: CODE IS STOPPING HERE and outputting the below..
                    print(email)
                    print(err.debugDescription)
                    self.showError("Error creating user")
                    
                }
                
                else {
        
                    // user was created successfully, now store the first name & last name.
                    let db = Firestore.firestore()
                    
            
            //find this error!!
                    db.collection ("users").addDocument(data: ["firstname": firstName, "lastname": lastName, "uid": result!.user.uid]) {(error) in
                        
                        if error != nil {
                            
                            //show error message //have a look at this code and text further..
                            self.showError ("User data could not be saved on the database")
                            
                            
                        }
                }
                    
                    
                    // transition to the homescreen
                    self.transitionToHome()

                    
     }
        
             
                
                
    }
        }

}
 

}
