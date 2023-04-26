//
//  ForgotPasswordFinalController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 10/4/2023.
//


import UIKit

import Alamofire
import SwiftyJSON


import CoreData
import SwiftUI



class ForgotPasswordFinalController: UIViewController {
    
    
    
    @IBOutlet weak var labelcode: UITextField!
    
    @IBOutlet weak var containeraftercode: UIView!
    
    @IBAction func btnYesCode(_ sender: Any) {
        
        
        
        
        
        let parameters: [String: String] = [
                "code": labelcode.text! as String,
            ]
        
        
        
        
        
        
        
        
        let url = "http://localhost:3007/user/passwordforget"

                AF.request(url, method: .post, parameters: parameters)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):


                            
                            
                            
                            
                            
                            let jsonRes = JSON(value)
                            
                            print("**************************")
                            print(jsonRes)
                            print("**************************")
                            
                            if(jsonRes["succes"] == "true"){
                                
                                
                                
                                
                                
                                self.containeraftercode.isHidden = false
                                
                            }

                            
                            
                            
                        case .failure(let error):
                            print("*error---------------------------------------------------")
                        }
                    }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.containeraftercode.isHidden = true

        
        
        let borderColor = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
        labelcode.layer.borderColor = borderColor
        labelcode.layer.cornerRadius = 20
        labelcode.layer.borderWidth = 1
        labelcode.layer.masksToBounds = true
        labelcode.font = UIFont.systemFont(ofSize: 20)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        labelcode.defaultTextAttributes = attributes
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        labelcode.leftView = paddingView
        labelcode.leftViewMode = .always
        
        

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
