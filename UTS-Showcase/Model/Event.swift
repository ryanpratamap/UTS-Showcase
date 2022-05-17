//
//  Event.swift
//  UTS-Showcase
//
//  Created by Elizabeth Kim on 6/5/22.
//  Edited by:
//  Adrian Crespo Sanjines
//  Elizabeth Kim
//  Michele Paulosky
//  Ryan Pratama Pangestu Lo

import Foundation
import UIKit

/*
 Event structure.
 */
struct Event: Codable {
    var title: String       //event title
    var date: String         //event date
    var time: String        //event time
    var location: String      //event location
    var description: String      //event description
    var imageName: String       //event image name
    var isReserved: Bool        //event reservation status
    var noOfTickets: Int   //number of tickets user will reserve
}
