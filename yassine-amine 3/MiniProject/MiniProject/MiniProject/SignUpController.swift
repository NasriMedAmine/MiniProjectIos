//
//  SignUpController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 31/3/2023.
//

import UIKit

import UIKit

import Alamofire


import CoreData

class SignUpController: UIViewController {

    @IBOutlet weak var LabelFullname: UITextField!
    @IBOutlet weak var LabelPhone: UITextField!
    @IBOutlet weak var LabelPassword: UITextField!
    @IBOutlet weak var LabelEmail: UITextField!
    @IBOutlet weak var LabelUsername: UITextField!
    
    
    @IBAction func btnRegister(_ sender: Any) {
        
        
        let name = LabelFullname.text! as String
        let password = LabelPassword.text! as String
        let email = LabelEmail.text! as String
        let tel = LabelPhone.text! as String
        let username = LabelUsername.text! as String
        var tel2 = Int(tel)!
//       self.register(name: name,
//                    username: username,
//                    email: email,
//                    tel: tel2,
//                    password: password)
//    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderColor = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        let paddingView3 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        let paddingView4 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        let paddingView5 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        LabelFullname.layer.borderColor = borderColor
        LabelFullname.layer.cornerRadius = 20
        LabelFullname.layer.borderWidth = 1
        LabelFullname.layer.masksToBounds = true
        LabelFullname.font = UIFont.systemFont(ofSize: 20)
        LabelFullname.defaultTextAttributes = attributes
        LabelFullname.leftView = paddingView
        LabelFullname.leftViewMode = .always
        
        LabelUsername.layer.borderColor = borderColor
        LabelUsername.layer.cornerRadius = 20
        LabelUsername.layer.borderWidth = 1
        LabelUsername.layer.masksToBounds = true
        LabelUsername.font = UIFont.systemFont(ofSize: 20)
        LabelUsername.defaultTextAttributes = attributes
        LabelUsername.leftView = paddingView2
        LabelFullname.leftViewMode = .always
        
        LabelPassword.layer.borderColor = borderColor
        LabelPassword.layer.cornerRadius = 20
        LabelPassword.layer.borderWidth = 1
        LabelPassword.layer.masksToBounds = true
        LabelPassword.font = UIFont.systemFont(ofSize: 20)
        LabelPassword.defaultTextAttributes = attributes
        LabelPassword.leftView = paddingView3
        LabelPassword.leftViewMode = .always
        
        LabelEmail.layer.borderColor = borderColor
        LabelEmail.layer.cornerRadius = 20
        LabelEmail.layer.borderWidth = 1
        LabelEmail.layer.masksToBounds = true
        LabelEmail.font = UIFont.systemFont(ofSize: 20)
        LabelEmail.defaultTextAttributes = attributes
        LabelEmail.leftView = paddingView4
        LabelEmail.leftViewMode = .always
        
        LabelPhone.layer.borderColor = borderColor
        LabelPhone.layer.cornerRadius = 20
        LabelPhone.layer.borderWidth = 1
        LabelPhone.layer.masksToBounds = true
        LabelPhone.font = UIFont.systemFont(ofSize: 20)
        LabelPhone.defaultTextAttributes = attributes
        LabelPhone.leftView = paddingView5
        LabelPhone.leftViewMode = .always
        
        
        
        
        
        
       
    }
    
    
    
    
    func register(name:String,username:String,email:String,tel:Int,password:String){
        
        let parameters: [String: Any] = [
                "name": name,
                "password": password,
                "tel" : tel,
                "email":email,
                "username" : username
            ]
        
//        let url = "http://localhost:3007/user/"
//
//                AF.request(url, method: .post, parameters: parameters)
//                    .responseJSON { response in
//                        switch response.result {
//                        case .success(let value):
//
//
//
//                            let jsonRes = JSON(value)
//
//                            print("--------------------------*********************")
//                            print(jsonRes)
//
//                            print("--------------------------*********************")
//
//                            if(jsonRes["succes"] == "true"){
//
//
//                                //var token = jsonRes["token"].rawValue as! String
//
//
//
//                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//                                let destinationVC = storyboard.instantiateViewController(withIdentifier: "NextSignUp")
//
//
//
//
//                                self.navigationController?.pushViewController(destinationVC, animated: true)
//
//                            }
//
//
//
//
//
//
//
//
//
//
//
//
//                        case .failure(let error):
//                            print("*error---------------------------------------------------")
//                        }
//                    }
        
        
        
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
