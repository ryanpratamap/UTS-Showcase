//
//  Account.swift
//  UTS-Showcase
//
//  Created by Elizabeth Kim on 14/5/22.
//
//  Edited by:
//  Adrian Crespo Sanjines
//  Elizabeth Kim
//  Michele Paulosky
//  Ryan Pratama Pangestu Lo

import Foundation
import UIKit

/*
 Account Structure
 */
struct Account: Codable {
    var id: String               // Students will have an ID
    var name: String             // All users have names
    var isStudent: Bool        // Flag to determine if user is a student or guest
    var currentData: [userData]  // Array of user data
    
    /*
     Function to update account data array
     Updates event reservation status and number of tickets
     */
    mutating func updateAccountData(eventName: String, reserveStatus: Bool, noOfTickets: Int) {
        // If the current data array does not contain the event, append it
        if (!currentData.contains(where: {$0.eventName == eventName})) {
            currentData.append(userData(eventName: eventName, reserveStatus: reserveStatus, noOfTickets: noOfTickets))
        }
        // Else, search for the event name in current data array and update fields
        else {
            for index in 0..<currentData.count {
                if (currentData[index].eventName == eventName) {
                    currentData[index].reserveStatus = reserveStatus
                    currentData[index].noOfTickets = noOfTickets
                }
            }
        }
    }
}

/*
 User Data Structure
 Contains all user-relevant information from all events
 */
struct userData: Codable {
    var eventName: String
    var reserveStatus: Bool
    var noOfTickets: Int
}

// Local account, global variable
var currentAccount = Account(id: "12345678" , name: "placeholder", isStudent: true, currentData: [])
