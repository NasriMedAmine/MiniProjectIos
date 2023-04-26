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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        labelEmail.text = SingletonClass.shared.emailUser
//        labelUsername.text = SingletonClass.shared.nameUser
//
//        print(SingletonClass.shared.emailUser)
//        print(SingletonClass.shared.nameUser)
        
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
