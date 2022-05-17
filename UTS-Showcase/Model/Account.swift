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
 Accounts structure
 */
struct Account: Codable {
    var id: String          //Students will have an id
    var name: String        //All users have names
    var notAStudent: Bool    //flag to determine if user is a student or guest
    var currentData: [userData]     //array of user data
    
    /*
     Function to update account data array
     Updates event reservation status and number of tickets
     */
    mutating func updateAccountData(eventName: String, reserveStatus: Bool, noOfTickets: Int) {
        //If the current data array does not contain the event. Append it.
        if (!currentData.contains(where: {$0.eventName == eventName})) {
            currentData.append(userData(eventName: eventName, reserveStatus: reserveStatus, noOfTickets: noOfTickets))
            
        } else {        //Else search for the event name in current data array and update fields
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
 User data structure
 Contains all user-relevant information from all events
 */
struct userData: Codable {
    var eventName: String
    var reserveStatus: Bool
    var noOfTickets: Int
}
//local account, global variable
var currentAccount = Account(id: "12345678" , name: "placeholder", notAStudent: false, currentData: [])
