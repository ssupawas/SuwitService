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
            
           checkAuthen(user: user, password: password)
            
        }
        
        
        
        
    } // SignInButton
    
    
    
    func checkAuthen(user: String, password: String) -> Void {
        
        let urlString: String = "https://www.androidthai.in.th/wit/getUserWhereUserSuwit.php?isAdd=true&User=\(user)"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            
            
            guard let testData = data,error == nil else {
                return
                
            }
            
            do {
                
//                Read JSON #1
                let jsonResponse = try JSONSerialization.jsonObject(with: testData, options: [])
                print("jsonResponse ==> \(jsonResponse)")
                
                
                
                
                
//                Chanhe JSON to Array
                guard let jsonArray = jsonResponse as? [[String: Any]] else{
                    return
                }
                print("jsonArray ==> \(jsonArray)")
                
//                Array to Dictionary
                let jsonDictionary: Dictionary = jsonArray[0]
                print("jsonDic ==> \(jsonDictionary)")
                
//                Check Password
                
                let truePassword: String = jsonDictionary["Password"] as! String
                
                if password == truePassword {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "GoMyService", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.myAlert(title: "Password False", message: "Please Try Agains Password False")
                    }
                }
                
                
                
            } catch let myError{
                
                print(myError)
                
//                User False
                DispatchQueue.main.async {
                    self.myAlert(title: "User False", message: "No This User in my Database")
                }
            }
            
            
        } // End Task
        task.resume()
        
        
        
        
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

