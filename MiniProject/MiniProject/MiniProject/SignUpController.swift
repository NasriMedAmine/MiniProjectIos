//
//  SignUpController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 31/3/2023.
//

import UIKit

import UIKit

import Alamofire
import SwiftyJSON

import CoreData
import AVFoundation

class SignUpController: UIViewController{

    @IBOutlet weak var LabelFullname: UITextField!
    @IBOutlet weak var LabelPhone: UITextField!
    @IBOutlet weak var LabelPassword: UITextField!
    @IBOutlet weak var LabelEmail: UITextField!
    @IBOutlet weak var LabelUsername: UITextField!
    @IBOutlet weak var LabelConfimPassword: UITextField!
    
    
    @IBOutlet weak var cameraIconLabel: UIImageView!
    
    @IBOutlet weak var imageSignupModif: UIImageView!
    @IBOutlet weak var imageUser: UIImageView!
    
    
    
    
    
    
    
    
    
    // UIImagePickerControllerDelegate methods

    //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Handle the image picked from the camera here
        //if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Do something with the image
        //}

        //dismiss(animated: true, completion: nil)
    //}

    //func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //dismiss(animated: true, completion: nil)
    //}

    //...
    
    
    
    
    
    
    @IBAction func btnRegister(_ sender: Any) {
        
        
        let name = LabelFullname.text! as String
        let password = LabelPassword.text! as String
        let email = LabelEmail.text! as String
        let tel = LabelPhone.text! as String
        let username = LabelUsername.text! as String
        let passconfirm = LabelConfimPassword.text! as String
        
        
        
        
        
        
        guard !name.isEmpty, !password.isEmpty, !email.isEmpty, !tel.isEmpty, !username.isEmpty, !passconfirm.isEmpty else {
                let alertController = UIAlertController(title: "Error", message: "Please fill in all the fields", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
                return
            }

            // Check if the password and confirmation password match
            guard password == passconfirm else {
                let alertController = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
                return
            }
        
        
        
        
        if Int(tel) is Int {
            print("myNumber is of type Int")
            self.register(name: name,
                         username: username,
                         email: email,
                          tel: Int(tel)!,
                         password: password)
            
        } else {
            let alertController2 = UIAlertController(title: "Error", message: "tel is not  number ", preferredStyle: .alert)
            let okAction2 = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController2.addAction(okAction2)
            present(alertController2, animated: true, completion: nil)
            
        }
       
    
    }
    
    let eyeImageView = UIImageView(image: UIImage(systemName: "eye.slash"))
    let eyeImageView2 = UIImageView(image: UIImage(systemName: "eye.slash"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
                let borderColor = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        let paddingView3 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        let paddingView4 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        let paddingView5 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        let paddingView6 =  UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
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
        LabelUsername.leftViewMode = .always
        
        LabelPassword.layer.borderColor = borderColor
        LabelPassword.layer.cornerRadius = 20
        LabelPassword.layer.borderWidth = 1
        LabelPassword.layer.masksToBounds = true
        LabelPassword.font = UIFont.systemFont(ofSize: 20)
        LabelPassword.defaultTextAttributes = attributes
        LabelPassword.leftView = paddingView3
        LabelPassword.leftViewMode = .always
        LabelPassword.isSecureTextEntry = true
        // Set the image view as the right view of the text field
        LabelPassword.rightView = eyeImageView
        LabelPassword.rightViewMode = .always

        // Create a tap gesture recognizer for the eye icon
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleEyeIconTap(_:)))
        eyeImageView.isUserInteractionEnabled = true
        eyeImageView.addGestureRecognizer(tapGestureRecognizer)
        
        
        LabelConfimPassword.layer.borderColor = borderColor
        LabelConfimPassword.layer.cornerRadius = 20
        LabelConfimPassword.layer.borderWidth = 1
        LabelConfimPassword.layer.masksToBounds = true
        LabelConfimPassword.font = UIFont.systemFont(ofSize: 20)
        LabelConfimPassword.defaultTextAttributes = attributes
        LabelConfimPassword.leftView = paddingView4
        LabelConfimPassword.leftViewMode = .always
        LabelConfimPassword.isSecureTextEntry = true
        LabelConfimPassword.rightView = eyeImageView
        LabelConfimPassword.rightViewMode = .always

        // Set the image view as the right view of the text field
        LabelConfimPassword.rightView = eyeImageView2
        LabelConfimPassword.rightViewMode = .always
        

                // Create a tap gesture recognizer for the eye icon
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(handleEyeIconTap2(_:)))
        eyeImageView2.isUserInteractionEnabled = true
        eyeImageView2.addGestureRecognizer(tapGestureRecognizer2)
        
        
        LabelEmail.layer.borderColor = borderColor
        LabelEmail.layer.cornerRadius = 20
        LabelEmail.layer.borderWidth = 1
        LabelEmail.layer.masksToBounds = true
        LabelEmail.font = UIFont.systemFont(ofSize: 20)
        LabelEmail.defaultTextAttributes = attributes
        LabelEmail.leftView = paddingView5
        LabelEmail.leftViewMode = .always
        
        LabelPhone.layer.borderColor = borderColor
        LabelPhone.layer.cornerRadius = 20
        LabelPhone.layer.borderWidth = 1
        LabelPhone.layer.masksToBounds = true
        LabelPhone.font = UIFont.systemFont(ofSize: 20)
        LabelPhone.defaultTextAttributes = attributes
        LabelPhone.leftView = paddingView6
        LabelPhone.leftViewMode = .always
        
        self.imageSignupModif.layer.borderWidth    = 2
        self.imageSignupModif.layer.borderColor = borderColor
        self.imageSignupModif.layer.cornerRadius = imageSignupModif.frame.size.height/10
        
        
        tapgesture()
    }
    
    
    func tapgesture(){
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        
        cameraIconLabel.addGestureRecognizer(tapGesture)
        cameraIconLabel.isUserInteractionEnabled = true
    }
    
    
    
    @objc func imageTapped() {
        
        
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker,animated: true)
        
        
        
        
//        let status = AVCaptureDevice.authorizationStatus(for: .video)
//        if status == .denied || status == .restricted {
//            // Camera access is denied or restricted, show an alert
//            let alert = UIAlertController(title: "Error", message: "Camera access is denied or restricted", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(alert, animated: true, completion: nil)
//        } else {
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.sourceType = .camera
//            present(imagePicker, animated: true, completion: nil)
//        }
    }

    
    
    
    
    
    
    @objc func handleEyeIconTap(_ sender: UITapGestureRecognizer) {
            // Toggle the visibility of the password text
            LabelPassword.isSecureTextEntry.toggle()

            // Update the eye icon image to reflect the current password text visibility
            if LabelPassword.isSecureTextEntry {
                eyeImageView.image = UIImage(systemName: "eye.slash")
            } else {
                eyeImageView.image = UIImage(systemName: "eye")
            }
        }
    
    @objc func handleEyeIconTap2(_ sender: UITapGestureRecognizer) {
            // Toggle the visibility of the password text
            LabelConfimPassword.isSecureTextEntry.toggle()

            // Update the eye icon image to reflect the current password text visibility
            if LabelConfimPassword.isSecureTextEntry {
                eyeImageView2.image = UIImage(systemName: "eye.slash")
            } else {
                eyeImageView2.image = UIImage(systemName: "eye")
            }
        }
    
    
    func register(name:String,username:String,email:String,tel:Int,password:String){
        
        let parameters: [String: Any] = [
                "name": name,
                "password": password,
                "tel" : tel,
                "email":email,
                "username" : username
            ]
        
        let url = "http://localhost:3007/user/"

        
//                AF.request(
//
//                    url,
//                    method: .post,
//                    parameters: parameters)
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
//                                print(type(of: jsonRes["email"].rawValue))
//                                print(jsonRes["email"].rawValue)
//                                print(type(of: jsonRes["email"].rawValue))
//
//                                //var token = jsonRes["token"].rawValue as! String
//
//                                SingletonClass.shared.emailUser = jsonRes["email"].rawValue as! String
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
//
        
        
        
        
        guard let image = imageUser.image,
              let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("Error: Couldn't convert image to data")
            return
        }
        
      
        AF.upload(multipartFormData: { multipartFormData in
                    
                    
                    for (key, value) in parameters {
                            multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                        }
                
                        
                    multipartFormData.append(imageData, withName: "image", fileName: name, mimeType: "image/jpeg")
                }, to: url).responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        print("Response: \(value)")
                        let jsonRes = JSON(value)
                        
                        SingletonClass.shared.emailUser = jsonRes["email"].rawValue as! String

                        let storyboard = UIStoryboard(name: "Main", bundle: nil)

                        let destinationVC = storyboard.instantiateViewController(withIdentifier: "NextSignUp")




                        self.navigationController?.pushViewController(destinationVC, animated: true)
                        
                        
                        
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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


extension SignUpController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
                               info: [UIImagePickerController.InfoKey : Any])
    
    {
     
        imageSignupModif.image = info[.originalImage] as? UIImage
        
        
        dismiss(animated: true, completion: nil)

        
    }
    
    
}
