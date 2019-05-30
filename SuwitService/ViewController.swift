//
//  ViewController.swift
//  SuwitService
//
//  Created by suwit supawas on 27/5/2562 BE.
//  Copyright © 2562 suwit supawas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }   // Main Method
    
    
    @IBAction func signInButton(_ sender: UIButton) {
        
//        Get Value From TextField
        let user: String = userTextField.text!
        let password: String = passwordTextField.text!
        
        if (user.count == 0) || (password.count == 0)  {
            myAlert(title: "มีช่องว่างนะจ๊ะ !!!", message: "กรุณากรอกให้ครบนะจ๊ะ") // ต้อง call methon หรือ function alert ที่เราสร้าง
        } else {
            
            
            
        }
        
        
        
        
    } // SignInButton
    
    
    
    func checkAuthen(user: String, password: String) -> Void {
        
        
        
        
    } // CheckAuthen
    
    // ต่อไปนี้เป็นการสร้าง function หรือ method  เพื่อให้มี popup ฟ้องขึ้นมาเมื่อกด signIn โดยที่ยังไม่ใส่ข้อมูล
    
    func myAlert(title: String, message: String) -> Void {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert) //object
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        
        
        
        
    }
    
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
       print("You Click SignUp")
        
        performSegue(withIdentifier: "GoRegister", sender: self)
        
    }
    

}   //Main Class

