//
//  ControllerEvent.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 28/3/2023.
//

import UIKit

class ControllerEvent: UIViewController,UITableViewDataSource   , UITableViewDelegate {
    
    struct Cell {
        let name: String
        let location: String
        let price: Int
        let date: String
        let description: String
    };
    
    var myData = [
        Cell(name: "event1", location: "ben arous", price: 150, date: "27/02/2023", description: "dsqdqsdqsdq"),
        Cell(name: "event2", location: "ben arous", price: 150, date: "27/02/2023", description: "dsqdqsdqsdq"),
        Cell(name: "event1", location: "ben arous", price: 150, date: "27/02/2023", description: "dsqdqsdqsdq")
    ];

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "mCellEvent")
        
        
        
        let contentView = cell1?.contentView
        
        
        
        let name = contentView?.viewWithTag(1) as! UILabel
        let location = contentView?.viewWithTag(2) as! UILabel
        let price = contentView?.viewWithTag(3) as! UILabel
        let date = contentView?.viewWithTag(4) as! UILabel
        let description = contentView?.viewWithTag(5) as! UILabel
        
        
        
        name.text = myData[indexPath.row].name
        location.text = myData[indexPath.row].location
        price.text = String(myData[indexPath.row].price)
        date.text = myData[indexPath.row].date
        description.text = myData[indexPath.row].description
        
        return cell1!
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
