//
//  DetailViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 3/5/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var eventDetailTitleLabel: UILabel!
    @IBOutlet weak var eventDetailTimeLabel: UILabel!
    @IBOutlet weak var eventDetailLocation: UILabel!
    @IBOutlet weak var eventDetailImageView: UIImageView!
    @IBOutlet weak var eventDetailDescription: UITextView!
    @IBOutlet weak var reservationButton: UIButton!
    @IBOutlet weak var numberOfTicketsLabel: UILabel!
    @IBOutlet weak var ticketQuantityStepper: UIStepper!
    
    var detailTitle: String?
    var detailTime: String?
    var detailDate: String?
    var detailLocation: String?
    var detailDescription: String?
    var detailImageName: String?
    var detailIsReserved: Bool?
    var detailNumberOfTickets = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        eventDetailTitleLabel.text = detailTitle
        eventDetailTimeLabel.text = "When: " + detailDate! + " " + detailTime!
        eventDetailLocation.text = "Where: " + detailLocation!
        eventDetailDescription.text = detailDescription
        eventDetailImageView.image = UIImage(named: detailImageName!)
        numberOfTicketsLabel.text = "Number of Tickets: " + String(detailNumberOfTickets)
        //If the event has been reserved, the reserve button should be disabled even if the user goes back to the event page
        if (detailIsReserved == true) {
            reservationButton.isEnabled = false
            reservationButton.setTitle("Reserved", for: .normal)
        }
    }
    
    @IBAction func ticketQtyStepper(_ sender: UIStepper) {
        detailNumberOfTickets = Int(sender.value)
        
        numberOfTicketsLabel.text = "Number of Tickets: " + String(detailNumberOfTickets)
        
    }
    
    @IBAction func reserveButtonPressed(_ sender: UIButton) {
        reservationButton.isEnabled = false
        let currentUDList = UDList()
        let currentEvents = currentUDList.readEvents()
        for index in 0..<currentEvents.count {
            if (currentEvents[index].title == detailTitle) {
                currentUDList.updateEvent(index: index, reservedStatus: true, numOfTickets: detailNumberOfTickets)
            }
        }
        reservationButton.setTitle("Reserved", for: .normal)
    }
}
