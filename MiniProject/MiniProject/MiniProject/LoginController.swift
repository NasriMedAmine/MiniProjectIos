//
//  LoginController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 30/3/2023.
//

import UIKit

import Alamofire
import SwiftyJSON


import CoreData
import SwiftUI



class LoginController: UIViewController {

    @IBSegueAction func Jump(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ListUsers())
    }
    @IBOutlet weak var forgotPassword: UITextView!
    @IBOutlet weak var PasswordLabel: UITextField!
    @IBOutlet weak var NameLabel: UITextField!
    
    @IBOutlet weak var SignUpLabel: UITextView!
    @IBAction func buttonLogin(_ sender: Any) {
        
        
        var name = NameLabel.text! as String
        var password = PasswordLabel.text! as String
        
        guard !name.isEmpty, !password.isEmpty else {
                let alertController = UIAlertController(title: "Error", message: "Please fill in all the fields", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
                return
            }
        
        
        onClickLogin(name: name, password: password)
        
        print("------------------------------------------")
        
        
        
        
    }
    
    
    let eyeImageView = UIImageView(image: UIImage(systemName: "eye.slash"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderColor = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
        NameLabel.layer.borderColor = borderColor
        NameLabel.layer.cornerRadius = 20
        NameLabel.layer.borderWidth = 1
        NameLabel.layer.masksToBounds = true
        NameLabel.font = UIFont.systemFont(ofSize: 20)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        NameLabel.defaultTextAttributes = attributes
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        NameLabel.leftView = paddingView
        NameLabel.leftViewMode = .always
        
        PasswordLabel.layer.borderColor = borderColor
        PasswordLabel.layer.cornerRadius = 20
        PasswordLabel.layer.borderWidth = 1
        PasswordLabel.layer.masksToBounds = true
        PasswordLabel.font = UIFont.systemFont(ofSize: 20)
        PasswordLabel.defaultTextAttributes = attributes
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        PasswordLabel.leftView = paddingView2
        PasswordLabel.leftViewMode = .always
        PasswordLabel.isSecureTextEntry = true
        // Set the image view as the right view of the text field
        PasswordLabel.rightView = eyeImageView
        PasswordLabel.rightViewMode = .always

        // Create a tap gesture recognizer for the eye icon
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleEyeIconTap(_:)))
        eyeImageView.isUserInteractionEnabled = true
        eyeImageView.addGestureRecognizer(tapGestureRecognizer)

        
        
        SignUpLabel.isUserInteractionEnabled = true
        SignUpLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTappedSignUp)))
        
        
        
        forgotPassword.isUserInteractionEnabled = true
        forgotPassword.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTappedforgotPassword)))

        
        
        
        
        
        if let myString = self.getMyUserToken() as? String {
            
            
            print("save++++++++++++++++++++++++++++++++++++++++")
            
            print(myString)
                       
            print("++++++++++++++++++++++++++++++++++++++++")
            // The variable is a non-nil string
            // Use myString in your code here
            goToMainWithToken(token: myString)
            
            
        } else {
            // The variable is nil or not a string
            // Handle the error case here
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func handleEyeIconTap(_ sender: UITapGestureRecognizer) {
            // Toggle the visibility of the password text
            PasswordLabel.isSecureTextEntry.toggle()

            // Update the eye icon image to reflect the current password text visibility
            if PasswordLabel.isSecureTextEntry {
                eyeImageView.image = UIImage(systemName: "eye.slash")
            } else {
                eyeImageView.image = UIImage(systemName: "eye")
            }
        }

    
    @objc func labelTappedSignUp() {
        
        print("nzelet aala sign up")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let destinationVC = storyboard.instantiateViewController(withIdentifier: "SignUp")
        
        
        
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
        // Do something when the label is tapped
    }
    
    @objc func labelTappedforgotPassword() {
        
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "forgotPassword")

        self.navigationController?.pushViewController(destinationVC, animated: true)
        // Do something when the label is tapped
    }

    
    
    
    
    func onClickLogin(name: String,password: String){
        
        
        
                
        
        
        
        //-------------------------------------------
        
        
//        let parameters: Parameters = [
//            "title": name,
//            "typedonation": listChecked,
//            "description": description,
//
//        ]
        
        let parameters: [String: String] = [
                "name": name,
                "password": password
            ]
        
        
        
        
        
        
        let url = "http://localhost:3007/user/login"

                AF.request(url, method: .get, parameters: parameters)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):

                      
                            
                            
                            let jsonRes = JSON(value)
                            
                            print("**************************")
                            print(jsonRes)
                            print("**************************")
                            
                            
                            
                            
                            if(jsonRes["succes"].rawValue as! String == "true"){
                                
                                var name = jsonRes["user"]["name"].rawValue as! String
                                var email = jsonRes["user"]["email"].rawValue as! String
                                var password = jsonRes["user"]["password"].rawValue as! String
                                var token = jsonRes["token"].rawValue as! String
                                
                                
                                SingletonClass.shared.token = token
                                SingletonClass.shared.emailUser = email
                                SingletonClass.shared.nameUser = name
                                
                                
                                
                                

                                var userJson = UserJson(name: name,
                                                        email: email,
                                                        password: password,
                                                        token: token
                                            )
                                
                                
                                
                                
                                print("**************************")
                                print(userJson)
                                print("**************************")
                                
                                
                                
                                
                                
                                print("**************************")
                                self.addUserToLocalStorage(name: userJson.name,
                                                      email: userJson.email,
                                                      token: userJson.token)
                                
                                print("saye hati f bd")
                                print("**************************")
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                //performSegue(withIdentifier: "FromLoginToHome", sender: nil)
                                //self.performSegue(withIdentifier: "FromLoginToHome", sender: nil)
                                
                               
                                
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)

                                let destinationVC = storyboard.instantiateViewController(withIdentifier: "MainVC2")
                                
                                
                                
                                
                                self.navigationController?.pushViewController(destinationVC, animated: true)
                                
                            }
                            
                            
                            if(jsonRes["message"].rawValue as! String == "!LoginEmailVerified"){

                                SingletonClass.shared.emailUser = jsonRes["email"].rawValue as! String
                                let storyboard1 = UIStoryboard(name: "Main", bundle: nil)

                                let destinationVC1 = storyboard1.instantiateViewController(withIdentifier: "NextSignUp")
                                
                                
                                
                                
                                self.navigationController?.pushViewController(destinationVC1, animated: true)
                                
                            }

                                
                            
                            
                           
                            
                            
                            
                            
                            
                            
                            
                        case .failure(let error):
                            print("*error---------------------------------------------------")
                        }
                    }
        
        
        
        //------------------------------------------
        
    }
    

//
//    func showAlertNavigate(title: String, message: String, buttonTitle: String = "OK", completion: (() -> Void)? = nil) {
//            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//            let action = UIAlertAction(title: buttonTitle, style: .default) { (_) in
//
//
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//
//
//
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "Profill") as! ProfilViewController
//            self.navigationController?.pushViewController(destinationVC, animated: true)        }
//
//            alert.addAction(action)
//
//            if let topViewController = UIApplication.shared.windows.first?.rootViewController {
//                topViewController.present(alert, animated: true, completion: nil)
//            }
//        }
//
//
//
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    
    func addUserToLocalStorage(name : String, email: String , token: String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenContainer = appDelegate.persistentContainer
        let managedContext = persistenContainer.viewContext

        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext) else {
            fatalError("Failed to retrieve entity description.")
        }

        let newUser = NSManagedObject(entity: entity, insertInto: managedContext)

        newUser.setValue(name, forKey: "name")
        newUser.setValue(token, forKey: "token")
        newUser.setValue(email, forKey: "email")
        
        
        

        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
        

    }
    
    
    
    
    func getMyUserToken() -> String! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenContainer = appDelegate.persistentContainer
        let managedContext = persistenContainer.viewContext

        let request = NSFetchRequest<NSManagedObject>(entityName: "User")
        
        
        
        
        
        

        do {
            let users = try managedContext.fetch(request)
            
            print("save++++++++++++++++++++++++++++++++++++++++")
            
            print(users)
           
            print(users.count)
            //print(users[0].value(forKey: "email"))
            
            print("++++++++++++++++++++++++++++++++++++++++")
            
            if(users.count > 0){
                return users[0].value(forKey: "token") as! String

            }
            
            
            // Do some++++++Âthing with the array of movie objects that was found
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            
        }
        return nil


    }
    
    
    
    func goToMainWithToken(token : String){
        
        
        let parameters: [String: String] = [
                "token": token,
            ]
        
        
        
        
        
        
        
        let url = "http://localhost:3007/user/loginWithToken"

                AF.request(url, method: .post, parameters: parameters)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):

                      
                            
                            
                            let jsonRes = JSON(value)
                            
                            print("**************************")
                            print(jsonRes)
                            print("**************************")
                            
                            if(jsonRes["succes"] == "true"){
                            
                                SingletonClass.shared.token = token
                                
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)

                                let destinationVC = storyboard.instantiateViewController(withIdentifier: "MainVC2")
                                
                                self.navigationItem.hidesBackButton = true

                                self.navigationItem.leftBarButtonItem = nil

                                self.navigationController?.pushViewController(destinationVC, animated: true)        }

                                
                            
                            
                            
                        case .failure(let error):
                            print("*error---------------------------------------------------")
                        }
                    }
        
        
    }
}
