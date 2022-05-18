//
//  DetailViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 3/5/22.
//
//  Edited by:
//  Adrian Crespo Sanjines
//  Elizabeth Kim
//  Michele Paulosky
//  Ryan Pratama Pangestu Lo

import Foundation
import UIKit

class DetailViewController: UIViewController {
    // Connections
    @IBOutlet weak var eventDetailTitleLabel: UILabel!
    @IBOutlet weak var eventDetailImageView: UIImageView!
    @IBOutlet weak var eventDetailTimeLabel: UILabel!
    @IBOutlet weak var eventDetailLocation: UILabel!
    @IBOutlet weak var eventDetailDescription: UITextView!
    @IBOutlet weak var numberOfTicketsLabel: UILabel!
    @IBOutlet weak var ticketQuantityStepper: UIStepper!
    @IBOutlet weak var reservationButton: UIButton!
    
    // Internal variables for all fields of an event
    // These receive their values from the EventViewController
    var detailTitle: String?
    var detailImageName: String?
    var detailDate: String?
    var detailTime: String?
    var detailLocation: String?
    var detailDescription: String?
    var detailNumberOfTickets = 1
    var detailIsReserved: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set content
        eventDetailTitleLabel.text = detailTitle
        eventDetailImageView.image = UIImage(named: detailImageName!)
        eventDetailTimeLabel.text = "When: \(detailDate!) \(detailTime!)"
        eventDetailLocation.text = "Where: \(detailLocation!)"
        eventDetailDescription.text = detailDescription
        numberOfTicketsLabel.text = "Number of Tickets: " + String(detailNumberOfTickets)
        
        // If the event has been reserved, the reserve button should be disabled even if the user goes back to the event page
        if (detailIsReserved!) {
            disableReserveButton()
        }
    }
    
    // Ticket quantity stepper pressed
    @IBAction func ticketQtyStepper(_ sender: UIStepper) {
        // Get value and update the label
        detailNumberOfTickets = Int(sender.value)
        numberOfTicketsLabel.text = "Number of Tickets: " + String(detailNumberOfTickets)
        
    }
    
    // Reserve button pressed
    @IBAction func reserveButtonPressed(_ sender: UIButton) {
        // Read from User Defaults
        let currentEvents = UDList.shared.readEvents()
        for index in 0..<currentEvents.count {
            // Find pressed event in event list
            if (currentEvents[index].title == detailTitle) {
                // Update reservation status and number of tickets and write changes to User Defaults
                UDList.shared.updateEvent(index: index, reservedStatus: true, numOfTickets: detailNumberOfTickets)
            }
        }
        
        disableReserveButton()
        
        // Update local account information
        currentAccount.updateAccountData(eventName: detailTitle!, reserveStatus: true, noOfTickets: detailNumberOfTickets)
    }
    
    // Set Reserve button to be disabled
    func disableReserveButton() {
        reservationButton.isEnabled = false
        reservationButton.setTitle("Reserved", for: .normal)
    }
}
