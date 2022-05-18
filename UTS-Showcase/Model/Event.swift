//
//  Event.swift
//  UTS-Showcase
//
//  Created by Elizabeth Kim on 6/5/22.
//
//  Edited by:
//  Adrian Crespo Sanjines
//  Elizabeth Kim
//  Michele Paulosky
//  Ryan Pratama Pangestu Lo

import Foundation
import UIKit

/*
 Event Structure
 */
struct Event: Codable {
    var title: String        // Event title
    var date: String         // Event date
    var time: String         // Event time
    var location: String     // Event location
    var description: String  // Event description
    var imageName: String    // Event image name
    var isReserved: Bool     // Event reservation status
    var noOfTickets: Int     // Number of tickets user will reserve
}
