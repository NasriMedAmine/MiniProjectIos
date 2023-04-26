//
//  ContainerYesNextSignUpController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 31/3/2023.
//

import UIKit

import Alamofire
import SwiftyJSON

import CoreData
import SwiftUI


class ContainerYesNextSignUpController: UIViewController {

    @IBOutlet weak var LabelCode: UITextField!
    
    
    @IBAction func btnValidate(_ sender: Any) {
        
        
        
        print("tao nzelet aala button add Code")
        
        
        
        var code = LabelCode.text! as String
        
        
        
        
        
        let url = "http://localhost:3007/user/emailValide"

        let parameters = [
            "email": SingletonClass.shared.emailUser,
            "code": code
        ]

        AF.request(url, method: .post, parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let jsonRes = JSON(value)
                    print("**************************")
                    print(jsonRes)
                    print("**************************")
                    
                    
                    print("**************************")
                    print(jsonRes["succes"] )
                    print("**************************")
                    if(jsonRes["succes"] == "true"){
                        
                        
                        
                        print("************************** f west if")
                        print(jsonRes["succes"] )
                        print("**************************")
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
        LabelCode.layer.borderColor = borderColor
        LabelCode.layer.cornerRadius = 20
        LabelCode.layer.borderWidth = 1
        LabelCode.layer.masksToBounds = true
        LabelCode.font = UIFont.systemFont(ofSize: 20)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        LabelCode.defaultTextAttributes = attributes
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        LabelCode.leftView = paddingView
        LabelCode.leftViewMode = .always

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
