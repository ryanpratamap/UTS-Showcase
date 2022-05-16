//
//  Account.swift
//  UTS-Showcase
//
//  Created by Elizabeth Kim on 14/5/22.
//

import Foundation
import UIKit

struct Account: Codable {
    var id: String
    var name: String
    //potentially password here as well
    var notAStudent: Bool
    //array of user data
    var currentData: [userData]
    
    mutating func updateAccountData(eventName: String, reserveStatus: Bool, noOfTickets: Int) {
        for index in 0..<currentData.count {
            if (!currentData.contains(where: {$0.eventName == eventName})) {
                currentData.append(userData(eventName: eventName, reserveStatus: reserveStatus, noOfTickets: noOfTickets))
                
            } else {
                currentData[index].reserveStatus = reserveStatus
                currentData[index].noOfTickets = noOfTickets
            }
        }
//        self.currentData.index[0]
        
        //everytime we make a change, this needs to be updated
        //reservations, detail (press reserve and cancel)
        //updates currentData
        
    }
    //in the UDAccountList, append to user data
}

struct userData: Codable {
    var eventName: String
    var reserveStatus: Bool
    var noOfTickets: Int
}
//local account, global variable
var currentAccount = Account(id: "12345678" , name: "placeholder", notAStudent: false, currentData: [])
