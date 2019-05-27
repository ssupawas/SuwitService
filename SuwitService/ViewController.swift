//
//  ViewController.swift
//  SuwitService
//
//  Created by suwit supawas on 27/5/2562 BE.
//  Copyright © 2562 suwit supawas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }   // Main Method
    
    
    
    
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
       print("You Click SignUp")
        
        performSegue(withIdentifier: "GoRegister", sender: self)
        
    }
    

}   //Main Class

