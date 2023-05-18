//
//  NextSignUpController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 31/3/2023.
//

import UIKit

class NextSignUpController: UIViewController {

    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var YesLabel: UITextView!
    
    @IBOutlet weak var NoLabel: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        container.isHidden = true
        
        
        YesLabel.isUserInteractionEnabled = true
        YesLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(YesNextSignup)))
        
        
        NoLabel.isUserInteractionEnabled = true
        NoLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NoNextSignup)))


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
    
    @objc func YesNextSignup() {
        
        
        
        
        
        
        
        
        
        
        
        
        
        container.isHidden = false
        
        
        
        

    }
    
    @objc func NoNextSignup() {
        
        print("nzelet aala sign up")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let destinationVC = storyboard.instantiateViewController(withIdentifier: "Login")
        
        
        
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
        // Do something when the label is tapped
    }
    

}
