//
//  ControllerListDonation.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 28/3/2023.
//

import UIKit

class ControllerListDonation: UIViewController    , UITableViewDataSource   , UITableViewDelegate{
    
    struct Cell {
        let title: String
        let type: String
        let description: String
    };
    
    var myData = [Cell(title: "Donation1", type: "clothes,Food", description: "dqsd"),
    Cell(title: "donation2", type: "food", description: "dqs")];
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData .count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "mCell")
        
        
        
        let contentView = cell1?.contentView
        
        
        
        let title = contentView?.viewWithTag(1) as! UILabel
        let type = contentView?.viewWithTag(2) as! UILabel
        let description = contentView?.viewWithTag(3) as! UILabel
        
        
        
        title.text = myData[indexPath.row] .title
        type.text = myData[indexPath.row]  .type
        description.text = myData[indexPath.row] .description
        
        return cell1!
        
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
