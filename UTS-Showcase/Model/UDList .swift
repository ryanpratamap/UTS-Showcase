//
//  UDList .swift
//  UTS-Showcase
//
//  Created by Michele Paulosky on 5/13/22.
//

import Foundation
import UIKit

struct UDList {
    func writeEvents() {
        // Write high scores to User Defautls
        let defaults = UserDefaults.standard
        //var updatedEvents = readEvents()
        
        //if (name != nil) {
        //updatedHighScoreFromGame.append(GameScore(name: name!, score: score!))
        let updatedEvents = (
            [Event(title: "Engineering Prototype Exhibition", date: "June 28, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "This prototype exhibition will include a selection of student groupwork chosen by the subject coordinators. Students will present their work to friends, family and industry connections. Prizes will be awarded in a range of categories and drinks and food will be provided. This is a great opportunity to see some of the innovative work across a variety of subjects in the Faculty of Engineering and IT. The exhibition is part of the UTS Tech Festival which is a two-week festival of events including hackathons, workshops, masterclasses, showcases and more!", imageName: "Engineering", isReserved: false,  noOfTickets: 1), Event(title: "Architecture Prototype Exhibition", date: "June 29, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "The Faculty of Design, Architecture and Building will showcase the most impressive work from the Autumn semester in this end of the semester event. The work will feature student and faculty designs focusing on sustainable design.", imageName: "Architecture", isReserved: false, noOfTickets: 1), Event(title: "IT Prototype Exhibition", date: "June 27, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "The school of IT welcomes students, faculty, friends, family and industry partners to join the end of the semester showcase event. This past semester IT students have worked hard on innovative and upcoming computer science projects. Come to see the work of our future IT leaders.", imageName: "IT", isReserved: false, noOfTickets: 1)])
        defaults.set(try? PropertyListEncoder().encode(updatedEvents), forKey: EVENTS_LIST_KEY)
    }
    
    func updateEvent(index: Int, reservedStatus: Bool, numOfTickets: Int) {
        let defaults = UserDefaults.standard
        
        var updatedEvents = readEvents()
        updatedEvents[index].isReserved = reservedStatus
        updatedEvents[index].noOfTickets = numOfTickets
        
        defaults.set(try? PropertyListEncoder().encode(updatedEvents), forKey: EVENTS_LIST_KEY)
    }
    
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
