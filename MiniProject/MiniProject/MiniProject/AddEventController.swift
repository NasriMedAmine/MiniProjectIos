//
//  AddEventController.swift
//  MiniProject
//
//  Created by Mac Mini 11 on 12/4/2023.
//

import UIKit
import SwiftUI

class AddEventController: UIViewController {
    
    
    @IBOutlet weak var NameEvent: UITextField!
    @IBOutlet weak var LocationEvent: UITextField!
    @IBOutlet weak var PriceEvent: UITextField!
    @IBOutlet weak var DescriptionEvent: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let borderColor = UIColor(red: 102/255, green: 206/255, blue: 200/255, alpha: 1.0).cgColor
        NameEvent.layer.borderColor = borderColor
        NameEvent.layer.cornerRadius = 20
        NameEvent.layer.borderWidth = 1
        NameEvent.layer.masksToBounds = true
        NameEvent.font = UIFont.systemFont(ofSize: 20)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        NameEvent.defaultTextAttributes = attributes
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        NameEvent.leftView = paddingView
        NameEvent.leftViewMode = .always
        
        
        LocationEvent.layer.borderColor = borderColor
        LocationEvent.layer.cornerRadius = 20
        LocationEvent.layer.borderWidth = 1
        LocationEvent.layer.masksToBounds = true
        LocationEvent.font = UIFont.systemFont(ofSize: 20)
        
        LocationEvent.defaultTextAttributes = attributes
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        LocationEvent.leftView = paddingView2
        LocationEvent.leftViewMode = .always
        
        
        PriceEvent.layer.borderColor = borderColor
        PriceEvent.layer.cornerRadius = 20
        PriceEvent.layer.borderWidth = 1
        PriceEvent.layer.masksToBounds = true
        PriceEvent.font = UIFont.systemFont(ofSize: 20)
        
        PriceEvent.defaultTextAttributes = attributes
        let paddingView3 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        PriceEvent.leftView = paddingView3
        PriceEvent.leftViewMode = .always
        
        
        
        DescriptionEvent.layer.borderColor = borderColor
        DescriptionEvent.layer.cornerRadius = 20
        DescriptionEvent.layer.borderWidth = 1
        DescriptionEvent.layer.masksToBounds = true
        DescriptionEvent.font = UIFont.systemFont(ofSize: 20)
        DescriptionEvent.defaultTextAttributes = attributes
        let paddingView4 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        DescriptionEvent.leftView = paddingView4
        DescriptionEvent.leftViewMode = .always
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
