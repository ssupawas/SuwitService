//
//  RegisterViewController.swift
//  SuwitService
//
//  Created by suwit supawas on 27/5/2562 BE.
//  Copyright © 2562 suwit supawas. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    let nameSegue: String = "BackAuthen"
    
    var name: String?
    var user: String?
    var password: String?
    
    
    
    
    
    
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    
    @IBOutlet weak var userTextfield: UITextField!
    
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } // Main Method
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        
        print("You Click Back")
        performSegue(withIdentifier: nameSegue, sender: self)
    }
    
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        
        var nameString: String = ""
        var userString: String = ""
        var passwordString: String = ""
        
        
      name = nameTextfield.text
        print("name = \(name)")
        
       if let testName = name {
            print("testName = \(testName)")
            nameString = testName
        }
        
        user = userTextfield.text
        if let testName = user {
            userString = testName
            print("userString = \(userString)")
        }
        
        password = passwordTextfield.text
        if let testpassword = password {
            passwordString = testpassword
            print("password \(passwordString)")
        }
        
//        Check Space
        if (nameString.count == 0) {
            print("Name is space")
        }   else if (userString.count == 0) {
            print("User is space")
        } else if (passwordString.count == 0) {
            print("password is space")
        }
        
    } // uploadButton
    
    
 

} // Main Class
