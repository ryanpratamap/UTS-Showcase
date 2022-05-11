//
//  Event.swift
//  UTS-Showcase
//
//  Created by Elizabeth Kim on 6/5/22.
//

import Foundation
import UIKit

struct Event: Codable {
    var title: String
    var date: String
    var time: String
    var location: String
    var description: String
    var imageName: String
    var noOfTickets: Int   //determine number of tickets user will reserve
}

//add events details
