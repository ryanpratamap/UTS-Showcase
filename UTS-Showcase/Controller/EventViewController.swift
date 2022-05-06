//
//  EventViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 3/5/22.
//

import Foundation
import UIKit
//All events

class EventViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var name:String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        welcomeLabel.text = "Welcome \(name!)!"
    }

}
