//
//  NextForgotPasswordContainerController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 10/4/2023.
//


import UIKit

import Alamofire
import SwiftyJSON


import CoreData
import SwiftUI

class NextForgotPasswordContainerController: UIViewController {
    
    
    
    @IBOutlet weak var labelname: UILabel!
    
    @IBOutlet weak var labelemail: UILabel!
    
    @IBAction func btnYesAction(_ sender: Any) {
        
        print("nzelet aala button yes")
        
        let storyboard3 = UIStoryboard(name: "Main", bundle: nil)

        let destinationVC3 = storyboard3.instantiateViewController(withIdentifier: "FinalForgotPassword")
        
        
        
        
        self.navigationController?.pushViewController(destinationVC3, animated: true)
    }
    
    
    func runLoopFinal(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            // Run your loop here
           
            var loopPP = false
            while loopPP == false {
                if (SingletonClass.shared.isContainerPasswordForget){
                    
                    
                    loopPP = true
                }
            }
            
            
            DispatchQueue.main.async {
                completion() // Call the completion handler on the main thread
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.runLoopFinal {
            
            self.labelname.text = SingletonClass.shared.emailUser
            self.labelemail.text = SingletonClass.shared.nameUser
            print("----------------------------------------------------------------")
            print("----------------------------------------------------------------")
            print("---------------------------test f container forget password----------")

            print(SingletonClass.shared.emailUser)
            print(SingletonClass.shared.nameUser)
            print("----------------------------------------------------------------")
            print("----------------------------------------------------------------")
        }
//        self.labelname.text = SingletonClass.shared.emailUser
//        self.labelemail.text = SingletonClass.shared.nameUser
//        print("----------------------------------------------------------------")
//        print("----------------------------------------------------------------")
//        print("---------------------------test f container forget password----------")
//
//        print(SingletonClass.shared.emailUser)
//        print(SingletonClass.shared.nameUser)
//        print("----------------------------------------------------------------")
//        print("----------------------------------------------------------------")

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
