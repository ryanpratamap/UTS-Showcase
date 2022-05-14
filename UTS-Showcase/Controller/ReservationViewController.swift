//
//  ReservationViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 3/5/22.
//

import Foundation
import UIKit


class ReservationViewController: UIViewController {

    @IBOutlet weak var YourReservationsLabel: UILabel!
    @IBOutlet weak var ReservationTable: UITableView!
    @IBOutlet weak var WelcomeLabel: UILabel!
    
    var reservationsList: [Event] = []
    //Function only executes once, to setup the view unless called by a segue
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Set custom cell row height
        ReservationTable.rowHeight = 100

    }
    //Function executes every time the user goes to the reservations page
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let udEventList = UDList()
        let currentUDList = udEventList.readEvents()
        //print("read events")
        
        for i in 0..<currentUDList.count {
            //Add to reservations page only if event is reserved, and it does not already exist in the reservations list
            if (currentUDList[i].isReserved == true && !reservationsList.contains(where: {$0.title == currentUDList[i].title})) {
                reservationsList.append(currentUDList[i])
                //print("appended reserved event to list")
            }
        }
        //Update reservation table view contents
        ReservationTable.reloadData()
    }
        
}

extension ReservationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservationsList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Dequed a reusable cell from the table view
        let cell = ReservationTable.dequeueReusableCell(withIdentifier: "reservedEvent", for: indexPath) as! ReservationTVC;
        
        // Updated the UI for this Cell
        let eventInstance = reservationsList[indexPath.row]
        
        cell.EventName.text = eventInstance.title;
        cell.EventTime.text = eventInstance.time;
        cell.EventImgView.image = UIImage(named: eventInstance.imageName)
        cell.NumberofTickets.text = String(eventInstance.noOfTickets)
        
        // Return the cell to TableView
        return cell;
        
    }
}
