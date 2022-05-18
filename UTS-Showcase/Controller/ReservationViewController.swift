//
//  ReservationViewController.swift
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


class ReservationViewController: UIViewController {
    //Connections
    @IBOutlet weak var YourReservationsLabel: UILabel!
    @IBOutlet weak var ReservationTable: UITableView!
    @IBOutlet weak var WelcomeLabel: UILabel!
    //List of reserved events
    var reservationsList: [Event] = []
    
    //viewDidLoad only executes once, to setup the view object unless called by a segue
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Set custom cell row height
        ReservationTable.rowHeight = 120
        WelcomeLabel.text = "Hi \(currentAccount.name)!"

    }
    //viewWillAppear executes every time the user goes to the reservations page
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //read from user defaults
        let currentUDList = UDList.shared.readEvents()
        
        for i in 0..<currentUDList.count {
            //Add to reservations page only if event is reserved, and it does not already exist in the reservations list
            if (currentUDList[i].isReserved == true && !reservationsList.contains(where: {$0.title == currentUDList[i].title})) {
                reservationsList.append(currentUDList[i])
            }
        }
        //Update reservation table view contents
        ReservationTable.reloadData()
    }
        
}
//Table data source
extension ReservationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //display reservations list contents
        return reservationsList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Dequed a reusable cell from the table view
        let cell = ReservationTable.dequeueReusableCell(withIdentifier: "reservedEvent", for: indexPath) as! ReservationTVC;
        
        // Updated the UI for this Cell
        let eventInstance = reservationsList[indexPath.row]
        cell.reservedEventImageView.image = UIImage(named: eventInstance.imageName)
        cell.reservedEventNameLabel.text = eventInstance.title
        cell.reservedEventDateLabel.text = eventInstance.date
        cell.reservedEventTimeLabel.text = eventInstance.time
        cell.reservedEventLocationLabel.text = eventInstance.location
        cell.reservedTicketsLabel.text = "Tickets: " + String(eventInstance.noOfTickets)
        //User can view QR code for reserved tickets
        cell.viewQRButton.addTarget(self, action: #selector(goToQRPage), for: .touchUpInside)
        //Dictionary to access event information when cancelling an event
        let reservedEvent: [Int:Event] = [indexPath.row : eventInstance]
        cell.cancelButton.layer.setValue(reservedEvent, forKey: "EventData")
        cell.cancelButton.addTarget(self, action: #selector(cancelEvent), for: .touchUpInside)
        
        // Return the cell to TableView
        return cell;
    }
    /*
     Function that transitions to QRCodeViewController where user can see QR Codes
     */
    @objc func goToQRPage() {
        let vc = storyboard?.instantiateViewController(identifier: "QRCodeViewController") as! QRCodeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    /*
     Function that cancels a reservation for an event
     Updating user defaults information
     */
    @objc func cancelEvent(_ sender: UIButton) {
        //Instantiate dictionary
        let reservedEvent: [Int:Event] = sender.layer.value(forKey: "EventData") as! [Int:Event]
        //Call update event function using dictionary, and setting reservation status and number of tickets
        UDList.shared.updateEvent(title: Array(reservedEvent.values)[0].title, reservedStatus: false, numOfTickets: 1)
        //Update reservation list
        reservationsList.remove(at: Array(reservedEvent.keys)[0])
        //Update reservation table view
        ReservationTable.reloadData()
        //Update currentAccount with new information
        currentAccount.updateAccountData(eventName: Array(reservedEvent.values)[0].title, reserveStatus: false, noOfTickets: 1)
    }
}
