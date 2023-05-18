//
//  UpdateEventController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 13/4/2023.
//

import UIKit
import Alamofire
import SwiftUI

class UpdateEventController: UIViewController {

    
    @IBOutlet weak var DatePickerUpdate: UIDatePicker!
    @IBOutlet weak var upEventName: UITextField!
    @IBOutlet weak var upEventLocation: UITextField!
    @IBOutlet weak var upEventPrice: UITextField!
    @IBOutlet weak var upEventDescription: UITextField!
    
    
    var name: String?
    
    
    
    @IBAction func SubmitUpdateEvent(_ sender: Any) {
      
            
        updateEvent(name: upEventName.text! as String, location: upEventLocation.text! as String, price: upEventPrice.text! as String, date: DatePickerUpdate.date, description: upEventDescription.text! as String)
            

    }
    
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
        upEventName.text = name
        
        
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
        
        
        
        
        
        self.upEventLocation.text = SingletonClass.shared.LongToEventItem + " ;  " + SingletonClass.shared.LatiToEventItem
        self.upEventDescription.text = SingletonClass.shared.descriptionToEventItem
        self.upEventPrice.text = String(SingletonClass.shared.priceToEventItem)
        
        
        
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped))
        self.upEventLocation.addGestureRecognizer(tapGestureRecognizer)
        
        
        
        
        self.runLoopForLocation{
            print("-------------------------------------------------------")
            print("-------------------------------------------------------")


            print("kamalt loop runLoopForLocation")
            
            //self.LocationEvent.text = String(SingletonClass.shared.longitude) + "          "+String(SingletonClass.shared.latitude)
            
            self.upEventLocation.text = "\(SingletonClass.shared.longitude),\(SingletonClass.shared.latitude)"
            
            print("-------------------------------------------------------")
            print("-------------------------------------------------------")

        }
        
        
        
        
    }
    
    
    @objc func textFieldTapped() {
            // The text field was tapped, do something here
            print("Text field tapped!")
            print("LocationEvent!")
//        let swiftUIView = MapViewEent()
//        let hostingController = UIHostingController(rootView: swiftUIView)
//
//        present(hostingController, animated: true, completion: nil)

        
//        let swiftUIView = MapViewEent()
                let swiftUIView = ContentView3()

                let hostingController = UIHostingController(rootView: swiftUIView)
                let navController = UINavigationController(rootViewController: hostingController)
        hostingController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissSwiftUIView))
                present(navController, animated: true, completion: nil)
        
        
        }
    
    @objc func dismissSwiftUIView() {
            dismiss(animated: true, completion: nil)
        }
    
    
    
    
    func runLoopForLocation(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            // Run your loop here
           
            var loopPP = false
            while loopPP == false {
                if (SingletonClass.shared.isSayeKamelLocation){
                    
                    
                    loopPP = true
                }
            }
            
            
            DispatchQueue.main.async {
                completion() // Call the completion handler on the main thread
            }
        }
    }
    
    
    
    
    
    
    

    func updateEvent(name: String, location: String, price: String, date: Date, description: String) {
        let parameters: [String: Any] = [
            "name": name,
            "lieu": location,
            "prix": price,
            "date_event": date,
            "description": description
        ]
        
        
        
        AF.request("http://localhost:3007/event/upEventbyname", method: .put, parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Event updated successfully: \(value)")
                    
                    
                    let alertController = UIAlertController(title: "Succes", message: "event add in BD", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                case .failure(let error):
                    print("Failed to update event: \(error)")
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
