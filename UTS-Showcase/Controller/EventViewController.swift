//
//  EventViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 3/5/22.
//
//  Edited by:
//  Adrian Crespo Sanjines
//  Elizabeth Kim
//  Michele Paulosky
//  Ryan Pratama Pangestu Lo

import Foundation
import UIKit
//Event list key
let EVENTS_LIST_KEY = "events"

class EventViewController: UIViewController {
    //Connections
    @IBOutlet weak var eventTableView: UITableView!
    @IBOutlet weak var welcomeLabel: UILabel!
    //Event list
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Custon cell height
        eventTableView.rowHeight = 225
        //read from user defaults
        events = UDList.shared.readEvents()
    }

}
//Table data source
extension EventViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Display number of events in array
        return events.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Dequed a reusable cell from the table view
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "eventObj", for: indexPath) as! EventsTVC;
        
        // Updated the UI for this Cell
        let eventInstance = events[indexPath.row]
        
        cell.eventNameLabel.text = eventInstance.title;
        cell.eventDateLabel.text = eventInstance.date;
        cell.eventTimeLabel.text = eventInstance.time;
        cell.eventImageView.image = UIImage(named: eventInstance.imageName)
        
        // Return the cell to TableView
        return cell;
        
    }
}

extension EventViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Update the event list by reading from user defaults again
        events = UDList.shared.readEvents()
        
        //Obtain pressed event
        let eventInstance = events[indexPath.row]
        //Instantiate DetailViewController
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        //Pass all relevant information
        vc.detailTitle = eventInstance.title
        vc.detailTime = eventInstance.time
        vc.detailLocation = eventInstance.location
        vc.detailImageName = eventInstance.imageName
        vc.detailNumberOfTickets = eventInstance.noOfTickets
        vc.detailDate = eventInstance.date
        vc.detailDescription = eventInstance.description
        vc.detailIsReserved = eventInstance.isReserved
        //Transition to DetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.navigationItem.setHidesBackButton(false, animated: true)
        
    }
}
