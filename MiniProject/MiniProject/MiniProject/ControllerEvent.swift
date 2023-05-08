//
//  ControllerEvent.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 28/3/2023.
//

import UIKit
import Alamofire

class ControllerEvent: UIViewController,UITableViewDataSource   , UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    struct Cell {
        let name: String
        let location: String
        let price: Int
        let date: String
        let description: String
    };
    
    var myData = [Cell]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .singleLine
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
            let url = "http://localhost:3007/event/" // replace with your actual server endpoint
            AF.request(url).responseJSON { response in
                switch response.result {
                case .success(let data):
                    if let events = data as? [[String: Any]] {
                        // Parse event data and add to myData array
                        for event in events {
                            if let name = event["name"] as? String,
                               let location = event["lieu"] as? String,
                               let priceString = event["prix"] as? String,
                               let date = event["date_event"] as? String,
                               let description = event["description"] as? String,
                               let price = Int(priceString) {
                                self.myData.append(Cell(name: name, location: location, price: price, date: date, description: description))
                            }
                        }
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return myData.count
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "mCellEvent")
        cell1?.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

        
        
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
    
    

    func deleteEvent(_ eventName: String) {
        // Construct URL with query parameter
        let url = URL(string: "http://localhost:3007/event/delEventbyname?name=\(eventName)")!
        
        // Make DELETE request using Alamofire
        AF.request(url, method: .delete)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Event deleted successfully: \(value)")
                    if let index = self.myData.firstIndex(where: { $0.name == eventName }) {
                                        self.myData.remove(at: index)
                                        let indexPath = IndexPath(row: index, section: 0)
                                        self.tableView.deleteRows(at: [indexPath], with: .automatic)
                                        self.tableView.reloadData()
                                    }
                
                case .failure(let error):
                    print("Error deleting event: \(error)")
                }
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let eventNameToDelete = myData[indexPath.row].name
            
            
            // Call deleteEvent API to delete event from the server
            deleteEvent(eventNameToDelete)
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Delete action
           let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, view, completion) in
               let eventNameToDelete = self.myData[indexPath.row].name
               self.deleteEvent(eventNameToDelete)
               
               tableView.reloadData()
               completion(true)
           }
           deleteAction.image = UIImage(systemName: "trash")
           deleteAction.backgroundColor = .systemRed
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeConfig.performsFirstActionWithFullSwipe = false
        return swipeConfig
           
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let updateAction = UIContextualAction(style: .normal, title: nil) { (action, view, completion) in
            // Implement your update logic here
            let card = self.myData[indexPath.row]
            self.performSegue(withIdentifier: "UpdateEventSegue", sender: card.name)
            completion(true)
        }
        updateAction.image = UIImage(systemName: "pencil")
        updateAction.backgroundColor = .systemBlue
        
        let swipeConfig = UISwipeActionsConfiguration(actions: [updateAction])
        swipeConfig.performsFirstActionWithFullSwipe = false
        return swipeConfig
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpdateEventSegue" {
            if let name = sender as? String, let updateController = segue.destination as? UpdateEventController {
                updateController.name = name
                
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
