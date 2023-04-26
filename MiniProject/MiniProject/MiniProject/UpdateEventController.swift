//
//  UpdateEventController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 13/4/2023.
//

import UIKit

class UpdateEventController: UIViewController {

    
    @IBOutlet weak var upEventName: UITextField!
    @IBOutlet weak var upEventLocation: UITextField!
    @IBOutlet weak var upEventPrice: UITextField!
    @IBOutlet weak var upEventDescription: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let borderColor = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
        upEventName.layer.borderColor = borderColor
        upEventName.layer.cornerRadius = 20
        upEventName.layer.borderWidth = 1
        upEventName.layer.masksToBounds = true
        upEventName.font = UIFont.systemFont(ofSize: 20)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        upEventName.defaultTextAttributes = attributes
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        upEventName.leftView = paddingView
        upEventName.leftViewMode = .always
        
        
        upEventLocation.layer.borderColor = borderColor
        upEventLocation.layer.cornerRadius = 20
        upEventLocation.layer.borderWidth = 1
        upEventLocation.layer.masksToBounds = true
        upEventLocation.font = UIFont.systemFont(ofSize: 20)
        
        upEventLocation.defaultTextAttributes = attributes
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        upEventLocation.leftView = paddingView2
        upEventLocation.leftViewMode = .always
        
        
        upEventPrice.layer.borderColor = borderColor
        upEventPrice.layer.cornerRadius = 20
        upEventPrice.layer.borderWidth = 1
        upEventPrice.layer.masksToBounds = true
        upEventPrice.font = UIFont.systemFont(ofSize: 20)
        
        upEventPrice.defaultTextAttributes = attributes
        let paddingView3 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        upEventPrice.leftView = paddingView3
        upEventPrice.leftViewMode = .always
        
        
        
        upEventDescription.layer.borderColor = borderColor
        upEventDescription.layer.cornerRadius = 20
        upEventDescription.layer.borderWidth = 1
        upEventDescription.layer.masksToBounds = true
        upEventDescription.font = UIFont.systemFont(ofSize: 20)
        upEventDescription.defaultTextAttributes = attributes
        let paddingView4 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        upEventDescription.leftView = paddingView4
        upEventDescription.leftViewMode = .always
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
