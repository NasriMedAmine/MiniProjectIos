//
//  LoginController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 30/3/2023.
//

import UIKit

import Alamofire


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
        
        print("------------------------------------------")
        
        
        
        print(name)
        print(password)
        
        
        onClickLogin(name: name, password: password)
        
        print("------------------------------------------")
        
        
        
        
    }
    
    
    
    
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
        
        
        SignUpLabel.isUserInteractionEnabled = true
        SignUpLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTappedSignUp)))
        
        
        
        forgotPassword.isUserInteractionEnabled = true
        forgotPassword.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTappedforgotPassword)))

        
        
        
        
        
        if let myString = self.getMyUserToken() as? String {
            // The variable is a non-nil string
            // Use myString in your code here
            goToMainWithToken(token: myString)
            
            
        } else {
            // The variable is nil or not a string
            // Handle the error case here
        }
        
        

        // Do any additional setup after loading the view.
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
        
        
        
        
        
        
        
        
        
    }
}
