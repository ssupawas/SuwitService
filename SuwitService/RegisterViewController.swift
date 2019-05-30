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
//        print("name = \(name)")
        
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
            myAlert(message: "กรุณากรอกชื่อด้วยครับ")
        }   else if (userString.count == 0) {
            print("User is space")
            myAlert(message: "กรุณากรอก User ด้วยน๊ะจ๊ะ")
        } else if (passwordString.count == 0) {
            print("password is space")
            myAlert(message: "Please Fill Password in Blank")
        } else if (passwordString.count <= 5){
            myAlert(message: "Password more 6 Charactor")
        }
        
        // Upload To mysql Server
        uplodeToServer(name: nameString, user: userString, password: passwordString)
        
        
    } // uploadButton
    
    
    func uplodeToServer(name: String, user: String, password: String) -> Void {
        
        let urlString: String = "https://www.androidthai.in.th/wit/addUserSuwit.php?isAdd=true&Name=\(name)&User=\(user)&Password=\(password)"
        
        
        let objURL = URL(string: urlString) // แป้นบาส หรือ  API
        let request = NSMutableURLRequest(url: objURL!) // ความพยายามที่อยากให้ทำ
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            if error != nil {
                print("Have Error")
                
            } else {
//                Task ทำงานสำเร็จ
                if let testData = data {
                    
                    let canReadable = NSString(data: testData, encoding: String.Encoding.utf8.rawValue)
                    print("canReadable ==> \(canReadable)")
                    
                    if let testCanReadable = canReadable {
                      
                        if testCanReadable == "true" {
                            
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "BackAuthen", sender: self)
                            }
                            
                        } //if4
                        
                    } //if3
                    
                    
                } // if2
                
            } // if1
            
        } // End Task
        task.resume()
        
        
        
        
        
        
    } // UploadToServer
    
    
    
    func myAlert(message: String) -> Void {
        
        let objAlertDialog = UIAlertController(title: "มี Error เกิดขึ้น", message: message, preferredStyle: UIAlertController.Style.alert)
        
//        Create Button
        
        objAlertDialog.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlertDialog.dismiss(animated: true, completion: nil)
        }))
        
        present(objAlertDialog, animated: true, completion: nil)
        
        
        
        
    }
    
 

} // Main Class
