//
//  ContainerFinalForgotPassowrdController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 10/4/2023.
//


import UIKit

import Alamofire
import SwiftyJSON


import CoreData
import SwiftUI

class ContainerFinalForgotPassowrdController: UIViewController {

    
    @IBOutlet weak var labelpassword1: UITextField!
    
    @IBOutlet weak var labelpassword2: UITextField!
    @IBAction func btnChange2(_ sender: Any) {
        
        
        
        
        
        let parameters: [String: String] = [
                "newcode": labelpassword1.text! as String,
                "email": SingletonClass.shared.emailUser,
            ]
        
        
        
        
        
        
        
        
        let url = "http://localhost:3007/user/passwordforget"

                AF.request(url, method: .put, parameters: parameters)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):


                            
                            
                            
                            
                            
                            let jsonRes = JSON(value)
                            
                            print("**************************")
                            print(jsonRes)
                            print("**************************")
                            
                            if(jsonRes["succes"] == "true"){
                                
                                
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)

                                let destinationVC = storyboard.instantiateViewController(withIdentifier: "Login")
                                
                                
                                
                                
                                self.navigationController?.pushViewController(destinationVC, animated: true)
                                
                                
                                
                                
                                
                                
                            }

                            
                            
                            
                        case .failure(let error):
                            print("*error---------------------------------------------------")
                        }
                    }
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let borderColor = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
        labelpassword1.layer.borderColor = borderColor
        labelpassword1.layer.cornerRadius = 20
        labelpassword1.layer.borderWidth = 1
        labelpassword1.layer.masksToBounds = true
        labelpassword1.font = UIFont.systemFont(ofSize: 20)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        labelpassword1.defaultTextAttributes = attributes
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        labelpassword1.leftView = paddingView
        labelpassword1.leftViewMode = .always
        
        
        
        
        
        let borderColor2 = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
        labelpassword2.layer.borderColor = borderColor2
        labelpassword2.layer.cornerRadius = 20
        labelpassword2.layer.borderWidth = 1
        labelpassword2.layer.masksToBounds = true
        labelpassword2.font = UIFont.systemFont(ofSize: 20)
        let attributes2 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        labelpassword2.defaultTextAttributes = attributes2
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        labelpassword2.leftView = paddingView2
        labelpassword2.leftViewMode = .always
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
