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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //welcomeLabel.text = "Welcome, \(name!)!"
        writeEvents()
        eventTableView.rowHeight = 225
        events = readEvents()
    }

    func writeEvents() {
        // Write high scores to User Defautls
        let defaults = UserDefaults.standard
        //var updatedEvents = readEvents()
        
        //if (name != nil) {
        //updatedHighScoreFromGame.append(GameScore(name: name!, score: score!))
        let updatedEvents = (
            [Event(title: "Engineering Prototype Exhibition", date: "June 28, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "This prototype exhibition will include a selection of student groupwork chosen by the subject coordinators. Students will present their work to friends, family and industry connections. Prizes will be awarded in a range of categories and drinks and food will be provided. This is a great opportunity to see some of the innovative work across a variety of subjects in the Faculty of Engineering and IT. The exhibition is part of the UTS Tech Festival which is a two-week festival of events including hackathons, workshops, masterclasses, showcases and more!", imageName: "Engineering",  noOfTickets: 1), Event(title: "Architecture Prototype Exhibition", date: "June 29, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "The Faculty of Design, Architecture and Building will showcase the most impressive work from the Autumn semester in this end of the semester event. The work will feature student and faculty designs focusing on sustainable design.", imageName: "Architecture", noOfTickets: 1), Event(title: "IT Prototype Exhibition", date: "June 27, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "The school of IT welcomes students, faculty, friends, family and industry partners to join the end of the semester showcase event. This past semester IT students have worked hard on innovative and upcoming computer science projects. Come to see the work of our future IT leaders.", imageName: "IT", noOfTickets: 1)]
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
        cell.eventImageView.image = UIImage(named: eventInstance.imageName)
        
        // Return the cell to TableView
        return cell;
        
    }
}

extension EventViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //grab pressed event
        let eventInstance = events[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        vc.detailTitle = eventInstance.title
        vc.detailTime = eventInstance.time
        vc.detailLocation = eventInstance.location
        vc.detailImageName = eventInstance.imageName
        vc.detailNumberOfTickets = eventInstance.noOfTickets
        vc.detailDate = eventInstance.date
        vc.detailDescription = eventInstance.description
        
        self.navigationController?.pushViewController(vc, animated: true)
        vc.navigationItem.setHidesBackButton(false, animated: true)
        
    }
}
