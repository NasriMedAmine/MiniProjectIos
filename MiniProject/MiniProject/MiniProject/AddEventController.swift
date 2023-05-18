//
//  AddEventController.swift
//  MiniProject
//
//  Created by Mac Mini 11 on 12/4/2023.
//


import UIKit

import UIKit

import Alamofire
import SwiftyJSON

import CoreData
import AVFoundation
import SwiftUI
class AddEventController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var NameEvent: UITextField!
    @IBOutlet weak var LocationEvent: UITextField!
    @IBOutlet weak var PriceEvent: UITextField!
    @IBOutlet weak var DescriptionEvent: UITextField!
    
    
    @IBAction func btnSubmit(_ sender: Any) {
        
        
        
        
        
        
        self.SubmitToServer(NameEvent: NameEvent.text! as String,
                            LocationEvent: LocationEvent.text! as String,
                            PriceEvent: PriceEvent.text! as String,
                            DescriptionEvent: DescriptionEvent.text! as String,
                            date: datePicker.date
        )
        
    }
    
    
    @IBAction func btnReset(_ sender: Any) {
        NameEvent.text = ""
        LocationEvent.text = ""
        PriceEvent.text = ""
        DescriptionEvent.text = ""

        
    }
    
    
    
    
    
    
    func SubmitToServer
    (NameEvent:String,LocationEvent:String,PriceEvent:String,DescriptionEvent:String,date:Date){
        
        
        
        let parameters: [String: Any] = [
                "name": NameEvent,
                "lieu": LocationEvent,
                "prix" : PriceEvent,
                "description":DescriptionEvent,
                "date_event" :date,
                "latitude": SingletonClass.shared.latitude,
                "longitude" : SingletonClass.shared.longitude,
                "nameImage": "sfax",

            ]
        
        
        let url = "http://localhost:3007/event/"

        
        
        
    
        
        
        
        
        
        
        
        
        
                AF.request(
                    url,
                    method: .post,
                    parameters: parameters)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):



                            let jsonRes = JSON(value)

                            print("--------------------------*********************")
                            print(jsonRes)

                            print("--------------------------*********************")

                            if(jsonRes["succes"] == "true"){

                                let alertController = UIAlertController(title: "Succes", message: "event add in BD", preferredStyle: .alert)
                                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(okAction)
                                self.present(alertController, animated: true, completion: nil)

                            }












                        case .failure(let error):
                            print("*error---------------------------------------------------")
                        }
                    }

        
        
        
        
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
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.runLoopForLocation{
            print("-------------------------------------------------------")
            print("-------------------------------------------------------")


            print("kamalt loop runLoopForLocation")
            
            //self.LocationEvent.text = String(SingletonClass.shared.longitude) + "          "+String(SingletonClass.shared.latitude)
            
            self.LocationEvent.text = "\(SingletonClass.shared.longitude)  , \(SingletonClass.shared.latitude)"
            
            print("-------------------------------------------------------")
            print("-------------------------------------------------------")

        }
        
        // Add tap gesture recognizer to text field
        
        
        
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped))
                LocationEvent.addGestureRecognizer(tapGestureRecognizer)
        
        
        
        
        
        
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

