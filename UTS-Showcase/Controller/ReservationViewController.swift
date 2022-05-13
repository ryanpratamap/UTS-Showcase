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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let udEventList = UDList()
        let currentUDList = udEventList.readEvents()
        print("read events")
        
        for i in 0..<currentUDList.count {
            if (currentUDList[i].isReserved == true) {
                reservationsList.append(currentUDList[i])
                print("appended to list")
            }
        }
        
        ReservationTable.rowHeight = 200
        print(reservationsList)
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
