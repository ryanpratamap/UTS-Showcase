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

    //Connections
    @IBOutlet weak var eventDetailTitleLabel: UILabel!
    @IBOutlet weak var eventDetailTimeLabel: UILabel!
    @IBOutlet weak var eventDetailLocation: UILabel!
    @IBOutlet weak var eventDetailImageView: UIImageView!
    @IBOutlet weak var eventDetailDescription: UITextView!
    @IBOutlet weak var reservationButton: UIButton!
    @IBOutlet weak var numberOfTicketsLabel: UILabel!
    @IBOutlet weak var ticketQuantityStepper: UIStepper!
    //Internal variables for all fields of an event
    //These receive their values from the EventViewController
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
        //Set label contents
        eventDetailTitleLabel.text = detailTitle
        eventDetailTimeLabel.text = "When: " + detailDate! + " " + detailTime!
        eventDetailLocation.text = "Where: " + detailLocation!
        eventDetailDescription.text = detailDescription
        //Set image view to an image with provided name
        eventDetailImageView.image = UIImage(named: detailImageName!)
        numberOfTicketsLabel.text = "Number of Tickets: " + String(detailNumberOfTickets)
        //If the event has been reserved, the reserve button should be disabled even if the user goes back to the event page
        if (detailIsReserved == true) {
            reservationButton.isEnabled = false
            reservationButton.setTitle("Reserved", for: .normal)
        }
    }
    //Ticket quantity stepper pressed
    @IBAction func ticketQtyStepper(_ sender: UIStepper) {
        //Get value
        detailNumberOfTickets = Int(sender.value)
        //Update label
        numberOfTicketsLabel.text = "Number of Tickets: " + String(detailNumberOfTickets)
        
    }
    //Press reserve button
    @IBAction func reserveButtonPressed(_ sender: UIButton) {
        //Disable button
        reservationButton.isEnabled = false
        //Read from user defaults
        let currentEvents = UDList.shared.readEvents()
        
        for index in 0..<currentEvents.count {
            //Find pressed event in event list
            if (currentEvents[index].title == detailTitle) {
                //update reservation status and number of tickets and write changes to user defaults
                UDList.shared.updateEvent(index: index, reservedStatus: true, numOfTickets: detailNumberOfTickets)
            }
            
        }
        //Change reservation button text once pressed
        reservationButton.setTitle("Reserved", for: .normal)
        //update local account information
        currentAccount.updateAccountData(eventName: detailTitle!, reserveStatus: true, noOfTickets: detailNumberOfTickets)
    }
}
