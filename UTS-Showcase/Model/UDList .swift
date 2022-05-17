//
//  UDList .swift
//  UTS-Showcase
//
//  Created by Michele Paulosky on 5/13/22.
//

import Foundation
import UIKit

class UDList {
    static let shared = UDList()
    
    let defaults = UserDefaults.standard
    
    // Write events to User Defaults
    func writeEvents() {
        let updatedEvents = (
            [Event(title: "Engineering Prototype Exhibition", date: "June 28, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "This prototype exhibition will include a selection of student groupwork chosen by the subject coordinators. Students will present their work to friends, family and industry connections. Prizes will be awarded in a range of categories and drinks and food will be provided. This is a great opportunity to see some of the innovative work across a variety of subjects in the Faculty of Engineering and IT. The exhibition is part of the UTS Tech Festival which is a two-week festival of events including hackathons, workshops, masterclasses, showcases and more!", imageName: "Engineering", isReserved: false,  noOfTickets: 1), Event(title: "Architecture Prototype Exhibition", date: "June 29, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "The Faculty of Design, Architecture and Building will showcase the most impressive work from the Autumn semester in this end of the semester event. The work will feature student and faculty designs focusing on sustainable design.", imageName: "Architecture", isReserved: false, noOfTickets: 1), Event(title: "IT Prototype Exhibition", date: "June 27, 2022", time: "15:00pm - 18:00pm", location: "Building 11", description: "The school of IT welcomes students, faculty, friends, family and industry partners to join the end of the semester showcase event. This past semester IT students have worked hard on innovative and upcoming computer science projects. Come to see the work of our future IT leaders.", imageName: "IT", isReserved: false, noOfTickets: 1),Event(title: "Gender Equity Week", date: "June 13, 2022", time: "11:00am - 18:00pm", location: "Building 02", description: "Gender Equity Week at UTS is an opportunity to come together with individuals and groups from across the university those who work in equity and diversity and those who don’t – to talk, learn, and collaborate. All members of the UTS community can contribute to gender equity in their own roles and workspaces and this showcase and supplementary talks aims to inspire, motivate, and equip participants to know more and do better.", imageName: "genderEquity", isReserved: false, noOfTickets: 1), Event(title: "Green Week", date: "June 07, 2022", time: "10:00am - 15:00pm", location: "Building 08", description: "Come to UTS’s Green Week event and discover green startups, and visit a range of eco-friendly stalls - all while learning how you can make a difference to this world. From making your own green mocktails to beeswax wrap workshops, we have a range of interactive activities to help you reduce plastic in your life and live in a more sustainable way.", imageName: "greenWeek", isReserved: false, noOfTickets: 1), Event(title: "Tech Festival", date: "June 28, 2022", time: "14:00pm - 18:00pm", location: "Building 11", description: "What is UTS Tech Festival? The UTS Tech Festival is an exciting chance for us to celebrate and showcase the amazing student projects and talent within the UTS Faculty of Engineering and IT! It is a two-week festival of events including hackathons, workshops, masterclasses, showcases, and more! ", imageName: "techFestival", isReserved: false, noOfTickets: 1)])
        
        defaults.set(try? PropertyListEncoder().encode(updatedEvents), forKey: EVENTS_LIST_KEY)
    }
    
    // Update events by event index
    func updateEvent(index: Int, reservedStatus: Bool, numOfTickets: Int) {
        var updatedEvents = readEvents()
        updatedEvents[index].isReserved = reservedStatus
        updatedEvents[index].noOfTickets = numOfTickets
        
        defaults.set(try? PropertyListEncoder().encode(updatedEvents), forKey: EVENTS_LIST_KEY)
    }
    
    // Update events by event title
    func updateEvent(title: String, reservedStatus: Bool, numOfTickets: Int) {
        var updatedEvents = readEvents()
        for i in 0..<updatedEvents.count {
            if (updatedEvents[i].title == title) {
                updatedEvents[i].isReserved = reservedStatus
                updatedEvents[i].noOfTickets = numOfTickets
            }
        }
        
        defaults.set(try? PropertyListEncoder().encode(updatedEvents), forKey: EVENTS_LIST_KEY)
    }
    
    // Read events from User Defaults
    func readEvents() -> [Event] {
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
