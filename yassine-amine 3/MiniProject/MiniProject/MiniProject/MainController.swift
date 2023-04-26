//
//  MainController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 31/3/2023.
//

import UIKit

class MainController: UIViewController {

    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.hidesBackButton = true
//        navigationItem.leftBarButtonItem = nil
        navigationController?.navigationBar.backIndicatorImage = UIImage()
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
        navigationController?.navigationBar.isHidden = true

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
