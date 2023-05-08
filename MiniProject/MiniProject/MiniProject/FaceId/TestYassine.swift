////
////  ContainerFinalForgotPassowrdController.swift
////  MiniProject
////
////  Created by Mac Mini 10 on 10/4/2023.
////
//
//
//import UIKit
//
//import Alamofire
//import SwiftyJSON
//
//
//import CoreData
//import SwiftUI
//
//class ContainerFinalForgotPassowrdController: UIViewController {
//
//    
//    @IBOutlet weak var labelpassword1: UITextField!
//    
//    @IBOutlet weak var labelpassword2: UITextField!
//    @IBAction func btnChange2(_ sender: Any) {
//        
//        
//        
//        
//        
//        let parameters: [String: String] = [
//                "newcode": labelpassword1.text! as String,
//                "email": SingletonClass.shared.emailUser,
//            ]
//        
//        
//        
//        
//        
//        
//        guard labelpassword1.text == labelpassword2.text else {
//            let alertController = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alertController.addAction(okAction)
//            present(alertController, animated: true, completion: nil)
//            return
//        }
//        
//        let url = "http://localhost:3007/user/passwordforget"
//
//                AF.request(url, method: .put, parameters: parameters)
//                    .responseJSON { response in
//                        switch response.result {
//                        case .success(let value):
//
//
//                            
//                            
//                            
//                            
//                            
//                            let jsonRes = JSON(value)
//                            
//                            print("**************************")
//                            print(jsonRes)
//                            print("**************************")
//                            
//                            if(jsonRes["succes"] == "true"){
//                                
//                                
//                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//                                let destinationVC = storyboard.instantiateViewController(withIdentifier: "Login")
//                                
//                                
//                                
//                                
//                                self.navigationController?.pushViewController(destinationVC, animated: true)
//                                
//                                
//                                
//                                
//                                
//                                
//                            }
//
//                            
//                            
//                            
//                        case .failure(let error):
//                            print("*error---------------------------------------------------")
//                        }
//                    }
//        
//        
//        
//        
//    }
//    let eyeImageView = UIImageView(image: UIImage(systemName: "eye"))
//    let eyeImageView2 = UIImageView(image: UIImage(systemName: "eye"))
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        
//        let borderColor = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
//        labelpassword1.layer.borderColor = borderColor
//        labelpassword1.layer.cornerRadius = 20
//        labelpassword1.layer.borderWidth = 1
//        labelpassword1.layer.masksToBounds = true
//        labelpassword1.font = UIFont.systemFont(ofSize: 20)
//        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
//        labelpassword1.defaultTextAttributes = attributes
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
//        labelpassword1.leftView = paddingView
//        labelpassword1.leftViewMode = .always
//        labelpassword1.isSecureTextEntry = true
//        // Set the image view as the right view of the text field
//        labelpassword1.rightView = eyeImageView
//        labelpassword1.rightViewMode = .always
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleEyeIconTap(_:)))
//        eyeImageView.isUserInteractionEnabled = true
//        eyeImageView.addGestureRecognizer(tapGestureRecognizer)
//        
//        
//        
//        let borderColor2 = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
//        labelpassword2.layer.borderColor = borderColor2
//        labelpassword2.layer.cornerRadius = 20
//        labelpassword2.layer.borderWidth = 1
//        labelpassword2.layer.masksToBounds = true
//        labelpassword2.font = UIFont.systemFont(ofSize: 20)
//        let attributes2 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
//        labelpassword2.defaultTextAttributes = attributes2
//        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
//        labelpassword2.leftView = paddingView2
//        labelpassword2.leftViewMode = .always
//        labelpassword2.isSecureTextEntry = true
//        // Set the image view as the right view of the text field
//        labelpassword2.rightView = eyeImageView
//        labelpassword2.rightViewMode = .always
//        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(handleEyeIconTap2(_:)))
//        eyeImageView2.isUserInteractionEnabled = true
//        eyeImageView2.addGestureRecognizer(tapGestureRecognizer2)
//        
//        // Do any additional setup after loading the view.
//    }
//    
//
//    @objc func handleEyeIconTap(_ sender: UITapGestureRecognizer) {
//            // Toggle the visibility of the password text
//        labelpassword1.isSecureTextEntry.toggle()
//
//            // Update the eye icon image to reflect the current password text visibility
//            if labelpassword1.isSecureTextEntry {
//                eyeImageView.image = UIImage(systemName: "eye.slash")
//            } else {
//                eyeImageView.image = UIImage(systemName: "eye")
//            }
//        }
//    
//    @objc func handleEyeIconTap2(_ sender: UITapGestureRecognizer) {
//            // Toggle the visibility of the password text
//        labelpassword2.isSecureTextEntry.toggle()
//
//            // Update the eye icon image to reflect the current password text visibility
//            if labelpassword2.isSecureTextEntry {
//                eyeImageView2.image = UIImage(systemName: "eye.slash")
//            } else {
//                eyeImageView2.image = UIImage(systemName: "eye")
//            }
//        }
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
