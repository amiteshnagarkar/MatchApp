//
//  ViewController.swift
//  ProgressTracker
//
//  Created by Amitesh Nagarkar on 27/10/2019.
//  Copyright © 2019 Amitesh Nagarkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var guestButton: UIButton!
    
     
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()

    }

    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(loginButton)
        Utilities.styleFilledButton(guestButton)
        
        
        
    }
    

}

