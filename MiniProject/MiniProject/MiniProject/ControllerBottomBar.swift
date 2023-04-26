//
//  ControllerBottomBar.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 5/4/2023.
//

import UIKit
import SwiftUI

class ControllerBottomBar: UITabBarController, UITabBarControllerDelegate {
    
    var originalViewControllers: [UIViewController] = []

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.originalViewControllers = self.viewControllers ?? []


        // Do any additional setup after loading the view.
    }
    
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController), index == 3 {
            let swiftUIView = ListUsers()
            let hostingController = UIHostingController(rootView: swiftUIView)
            self.viewControllers?[3] = hostingController
        }
        
        
        
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController), index == 1 {
            let swiftUIView = AddDonation()
            let hostingController = UIHostingController(rootView: swiftUIView)
            self.viewControllers?[1] = hostingController
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
