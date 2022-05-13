//
//  EventViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 3/5/22.
//  Modified by Adrian Crespo Sanjines
//

import Foundation
import UIKit

//User defaults key for event list
let EVENTS_LIST_KEY = "events"

class EventViewController: UIViewController {
    //Outlet connections for tableView and label
    @IBOutlet weak var eventTableView: UITableView!
    @IBOutlet weak var welcomeLabel: UILabel!
    //Event list of type Event
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Write 3 initial events to user defaults
        writeEvents()
        //Set the table view cell height to 225
        eventTableView.rowHeight = 225
        //Get the user defaults event list to update the event list
        events = readEvents()
    }
    
    /*
     Function to write events to user defaults
     Writes the initial three events to user defaults list
     */
    func writeEvents() {
        let defaults = UserDefaults.standard
        //Updated event list to be sent to user defaults
        let updatedEvents = (
            [Event(title: "Engineering Prototype Exhibition", date: "June 28, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "This prototype exhibition will include a selection of student groupwork chosen by the subject coordinators. Students will present their work to friends, family and industry connections. Prizes will be awarded in a range of categories and drinks and food will be provided. This is a great opportunity to see some of the innovative work across a variety of subjects in the Faculty of Engineering and IT. The exhibition is part of the UTS Tech Festival which is a two-week festival of events including hackathons, workshops, masterclasses, showcases and more!", imageName: "Engineering",  noOfTickets: 1), Event(title: "Architecture Prototype Exhibition", date: "June 29, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "The Faculty of Design, Architecture and Building will showcase the most impressive work from the Autumn semester in this end of the semester event. The work will feature student and faculty designs focusing on sustainable design.", imageName: "Architecture", noOfTickets: 1), Event(title: "IT Prototype Exhibition", date: "June 27, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "The school of IT welcomes students, faculty, friends, family and industry partners to join the end of the semester showcase event. This past semester IT students have worked hard on innovative and upcoming computer science projects. Come to see the work of our future IT leaders.", imageName: "IT", noOfTickets: 1)]
        )
        //Set the updated list as the event list in user defaults
        defaults.set(try? PropertyListEncoder().encode(updatedEvents), forKey: EVENTS_LIST_KEY)
    }
    /*
     Function to read event list from user defaults
     Returns a list of type Event
     */
    func readEvents() -> [Event] {
        let defaults = UserDefaults.standard;
        //Read from user defaults and return array
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
    //The table view will display n events, where n is the current length of the events list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Dequed a reusable cell from the table view
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "eventObj", for: indexPath) as! EventsTVC;
        
        // Update the UI for this Cell
        let eventInstance = events[indexPath.row]
        //By setting the tableCell to be of type EventsTVC we can access each attribute from the custom cell
        //Events TVC is a CocoaTouch file
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
        //Select pressed event
        let eventInstance = events[indexPath.row]
        //Instantiate the Detail View Controller
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        //Send all respective data from the selected event
        vc.detailTitle = eventInstance.title
        vc.detailTime = eventInstance.time
        vc.detailLocation = eventInstance.location
        vc.detailImageName = eventInstance.imageName
        vc.detailNumberOfTickets = eventInstance.noOfTickets
        vc.detailDate = eventInstance.date
        vc.detailDescription = eventInstance.description
        //Transition to Detail View Controller
        self.navigationController?.pushViewController(vc, animated: true)
        vc.navigationItem.setHidesBackButton(false, animated: true)
        
    }
}
