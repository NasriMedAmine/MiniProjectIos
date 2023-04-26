//
//  NextSignUpController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 31/3/2023.
//

import UIKit

import Alamofire
import SwiftyJSON

import CoreData
import SwiftUI


class NextSignUpController: UIViewController {

    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var YesLabel: UITextView!
    
    @IBOutlet weak var NoLabel: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        container.isHidden = true
        
        
        YesLabel.isUserInteractionEnabled = true
        YesLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(YesNextSignup)))
        
        
        NoLabel.isUserInteractionEnabled = true
        NoLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NoNextSignup)))


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
    
    @objc func YesNextSignup() {
        
        
        
        
        
        
        
        let parameters2: [String: String] = [
                "email": SingletonClass.shared.emailUser,
            ]
        
        
        
        
        
        let url2 = "http://localhost:3007/user/emailValide"

                AF.request(url2, method: .get, parameters: parameters2)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):

                      
                            
                            
                            let jsonRes = JSON(value)
                            
                            print("**************************")
                            print(jsonRes)
                            print("**************************")
                            
                            if(jsonRes["succes"] == "true"){
                                self.container.isHidden = false

                                
                                
                            }

                            
                        case .failure(let error):
                            print("*error---------------------------------------------------")
                        }
                    }
        
        
        
        //------------------------------------------
        
        
        
        
        
        
        

    }
    
    @objc func NoNextSignup() {
        
        print("nzelet aala sign up")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let destinationVC = storyboard.instantiateViewController(withIdentifier: "Login")
        
        
        
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
        // Do something when the label is tapped
    }
    

}
