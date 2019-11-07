//
//  GuestViewController.swift
//  ProgressTracker
//
//  Created by Amitesh Nagarkar on 30/10/2019.
//  Copyright © 2019 Amitesh Nagarkar. All rights reserved.
//

import UIKit

class GuestViewController: UIViewController {
    
    
    @IBOutlet weak var goToHomeButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

        
        // Do any additional setup after loading the view.
    }
    
    
    func setUpElements() {
          
          //hide the error label
          
          //styles the elements
          Utilities.styleFilledButton(goToHomeButton )
         
          
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
