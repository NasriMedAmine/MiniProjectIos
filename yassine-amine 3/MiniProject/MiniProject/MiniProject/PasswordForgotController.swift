//
//  PasswordForgotController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 31/3/2023.
//


import UIKit

import Alamofire


import CoreData

class PasswordForgotController: UIViewController {

    
    @IBOutlet weak var emailLabel2: UITextField!
    @IBOutlet weak var container2: UIView!
    
    
    
    @IBAction func btnConfirmForgotPassword(_ sender: Any) {
        
        if((emailLabel2.text?.isEmpty) != nil){
            
            
            var email = emailLabel2.text! as String

            let parameters: [String: String] = [
                    "email": email,
                ]
            
            
            
            
            
            
            
            
            
            
            
        }
        else{
            
            print("fergha email")

           
            
            
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderColor = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
        emailLabel2.layer.borderColor = borderColor
        emailLabel2.layer.cornerRadius = 20
        emailLabel2.layer.borderWidth = 1
        emailLabel2.layer.masksToBounds = true
        emailLabel2.font = UIFont.systemFont(ofSize: 20)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        emailLabel2.defaultTextAttributes = attributes
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        emailLabel2.leftView = paddingView
        emailLabel2.leftViewMode = .always
        
        
        container2.isHidden = true


        // Do any additional setup after loading the view.
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
