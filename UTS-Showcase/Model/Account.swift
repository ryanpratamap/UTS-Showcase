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
}

var currentAccount = Account(id: "12345678" , name: "placeholder")
//bool to check if user is not a student
var notAStudent = false
