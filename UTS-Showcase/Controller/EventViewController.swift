//
//  EventViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 3/5/22.
//

import Foundation
import UIKit

let EVENTS_LIST_KEY = "events"

class EventViewController: UIViewController {
    
    @IBOutlet weak var eventTableView: UITableView!
    @IBOutlet weak var welcomeLabel: UILabel!
    //var name:String?
    var events: [Event] = []
    var eventImages = ["Engineering", "IT", "Architecture"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //welcomeLabel.text = "Welcome, \(name!)!"
        writeEvents()
        
        events = readEvents()
    }

    func writeEvents() {
        // Write high scores to User Defautls
        let defaults = UserDefaults.standard
        //var updatedEvents = readEvents()
        
        //if (name != nil) {
        //updatedHighScoreFromGame.append(GameScore(name: name!, score: score!))
        let updatedEvents = (
            [Event(title: "Engineering Prototype Exhibition", date: "June 28, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "Blah blah blah blah", noOfTickets: 0), Event(title: "Architecture Prototype Exhibition", date: "June 29, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "Blah blah blah blah", noOfTickets: 0), Event(title: "IT Prototype Exhibition", date: "June 27, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "Blah blah blah blah", noOfTickets: 0)]
        )
        //}
        
        defaults.set(try? PropertyListEncoder().encode(updatedEvents), forKey: EVENTS_LIST_KEY)
    }
    /*
     
     */
    func readEvents() -> [Event] {
        // Read from User Defaults
        // This should happen at the HighScrollViewController
        
        let defaults = UserDefaults.standard;
        
        if let savedArrayData = defaults.value(forKey:EVENTS_LIST_KEY) as? Data {
            if let array = try? PropertyListDecoder().decode(Array<Event>.self, from: savedArrayData) {
                return array
            } else {
                return []
            }
        } else {
            return []
        }
    }
}

extension EventViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        cell.eventImageView.image = UIImage(named: "Engineering")
        
        // Return the cell to TableView
        return cell;
        
    }
}
