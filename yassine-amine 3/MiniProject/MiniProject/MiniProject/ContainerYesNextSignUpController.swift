//
//  ContainerYesNextSignUpController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 31/3/2023.
//

import UIKit

class ContainerYesNextSignUpController: UIViewController {

    @IBOutlet weak var LabelCode: UITextField!
    
    
    
    @IBAction func btnValidate(_ sender: Any) {
        
        
        
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
