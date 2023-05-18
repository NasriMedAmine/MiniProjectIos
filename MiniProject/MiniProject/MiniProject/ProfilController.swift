//
//  ProfilController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 17/4/2023.
//

import UIKit
import CoreData

import Alamofire
import SwiftyJSON
import SwiftUI


class ProfilController: UIViewController {

    
    
    @IBOutlet weak var LogoutImageDoor: UIImageView!
    
    @IBOutlet weak var viewUserInfo: UIView!
    
    @IBOutlet weak var fullnameLabel2: UILabel!
    
    @IBOutlet weak var userNameLabel2: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var EmailLabel2: UILabel!
    
    @IBOutlet weak var phoneLabel2: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var EmailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var btnFaceId: UIImageView!
    
    
    @ObservedObject var managerView = SocketIOManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderColor = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
        self.imageView2.layer.borderWidth    = 4
        self.imageView2.layer.borderColor = borderColor
        self.imageView2.layer.cornerRadius = imageView2.frame.size.height/2
        
        
        self.viewUserInfo.layer.cornerRadius = imageView2.frame.size.height/10
        self.viewUserInfo.layer.shadowColor = UIColor.black.cgColor
        self.viewUserInfo.layer.shadowOpacity = 0.5
        self.viewUserInfo.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.viewUserInfo.layer.shadowRadius = 4

//        if let myString = self.getMyUserEmail() as? String {
//
//
//            print("save++++++++++++++++++++++++++++++++++++++++")
//
//            print(myString)
//
//            print("++++++++++++++++++++++++++++++++++++++++")
//            // The variable is a non-nil string
//            // Use myString in your code here
//            getWhoIamByEmail(token: myString)
//
//
//        } else {
//            // The variable is nil or not a string
//            // Handle the error case here
//        }
        self.getWhoIamByEmail(email: SingletonClass.shared.emailUser)
        
        tapgesture()
        tapgestureFaceId()
        

        // Do any additional setup after loading the view.
    }
    
    
    func getMyUserEmail() -> String! {
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
                return users[0].value(forKey: "email") as! String

            }
            
            
            // Do some++++++Âthing with the array of movie objects that was found
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            
        }
        return nil


    }
    
    
    func getWhoIamByEmail(email : String){
        
        
        let parameters: [String: String] = [
                "email": email,
            ]
        
        
        
        
        
        
        
        let url = "http://localhost:3007/user/loginWithEmail"

                AF.request(url, method: .post, parameters: parameters)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):

                      
                            
                            
                            let jsonRes = JSON(value)
                            
                            print("**************************")
                            print(jsonRes)
                            print("**************************")
//                            jsonRes["succes"]
                            
                            // Update labels with user info
                                                self.fullnameLabel2.text = jsonRes["name"].stringValue
                                                self.userNameLabel2.text = jsonRes["username"].stringValue
                                                self.EmailLabel2.text = jsonRes["email"].stringValue
                                                self.phoneLabel2.text = jsonRes["tel"].stringValue
                                
                            
                            
                            
                            
                            // Load image data from URL
                                                if let imageUrlString = jsonRes["photoName"].string, let imageUrl = URL(string: "http://localhost:3007/\(imageUrlString)") {
                                                    AF.request(imageUrl,method: .get).responseData { response in
                                                        if let data = response.data, let image = UIImage(data: data) {
                                                            DispatchQueue.main.async {
                                                                // Assign image to UIImageView
                                                                self.imageView2.image = image
                                                            }
                                                        }
                                                    }
                                                }
                            
                            
                            
                            
                            
                            
                        case .failure(let error):
                            print("*error---------------------------------------------------")
                        }
                    }
        
        
    }
    
    
    func tapgesture(){
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(Logout))
        
        
        LogoutImageDoor.addGestureRecognizer(tapGesture)
        LogoutImageDoor.isUserInteractionEnabled = true
    }
    
    
    func tapgestureFaceId(){
        
        
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(toFaceIdSwift))
        
        
        btnFaceId.addGestureRecognizer(tapGesture2)
        btnFaceId.isUserInteractionEnabled = true
    }
    
    @objc func toFaceIdSwift(){
        
        
        
        let swiftUIView = TestFaceId()

        let hostingController = UIHostingController(rootView: swiftUIView)
        let navController = UINavigationController(rootViewController: hostingController)
        hostingController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissSwiftUIView))
        present(navController, animated: true, completion: nil)
        
        
        
    }
    @objc func dismissSwiftUIView() {
            dismiss(animated: true, completion: nil)
        }
    
    
    
    @objc func Logout() {
        
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let persistenContainer = appDelegate.persistentContainer
            let managedContext = persistenContainer.viewContext
            
            let request = NSFetchRequest<NSManagedObject>(entityName: "User")
            request.predicate = NSPredicate(format: "token = %@", SingletonClass.shared.token)
            
            do {
                print("-----------------------------------------")
                                                print("-----------------------------------------")
                                                print("-----------SingletonClass.shared.token")
                                                print(SingletonClass.shared.token)
                let users = try managedContext.fetch(request)
                if let user = users.first {
                    print("-----------------------------------------")
                                                    print("-----------------------------------------")
                                                    print("-----------user")
                                                    print(user)
                    managedContext.delete(user)
                    try managedContext.save()
                    print("-----------------------------------------")
                                                    print("-----------------------------------------")
                                                    print("-----------managedContext")
                                                    print(managedContext)
                }
            } catch let error as NSError {
                print("Could not remove user. \(error), \(error.userInfo)")
                print("-----------------------------------------")
                                                print("-----------------------------------------")
                                                print("-----------error")
                                                print(error)
            }
        
        
        
        
        
        
        
        print("yassine yassine")
        performSegue(withIdentifier: "LogoutSegue", sender: nil)
        
        
        
        
        
        
        self.managerView.logOut(name: SingletonClass.shared.nameUser)
        
        
        
        
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
