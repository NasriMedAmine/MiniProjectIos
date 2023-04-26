//
//  ControllerUsers.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 28/3/2023.
//

import UIKit
import SwiftUI

class ControllerUsers: UIViewController,UITableViewDataSource   , UITableViewDelegate , UITabBarControllerDelegate{
    
    
    var myData = ["user1","user2","user3","user4","user5"]
    
    
    
    @IBSegueAction func GoFromSwiftTOKit(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ListUsers())
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "mCellUser")
        
        
        
        let contentView = cell1?.contentView
        
        
        
        let name = contentView?.viewWithTag(2) as! UILabel
        
        
        
        
        name.text = myData[indexPath.row]
        
        
        return cell1!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 1
        let headerView = UIView()
        // 2
        headerView.backgroundColor = view.backgroundColor
        // 3
        return headerView
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
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
