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


class ProfilController: UIViewController {

    
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        if let myString = self.getMyUserEmail() as? String {
            
            
            print("save++++++++++++++++++++++++++++++++++++++++")
            
            print(myString)
                       
            print("++++++++++++++++++++++++++++++++++++++++")
            // The variable is a non-nil string
            // Use myString in your code here
            getWhoIamByEmail(token: myString)
            
            
        } else {
            // The variable is nil or not a string
            // Handle the error case here
        }
        
        
        

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
    
    
    func getWhoIamByEmail(token : String){
        
        
        let parameters: [String: String] = [
                "email": token,
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
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
