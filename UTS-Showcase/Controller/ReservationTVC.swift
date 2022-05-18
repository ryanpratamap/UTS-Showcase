//
//  ReservationTVC.swift
//  UTS-Showcase
//
//  Created by Michele Paulosky on 5/13/22.
//
//  Edited by:
//  Adrian Crespo Sanjines
//  Elizabeth Kim
//  Michele Paulosky
//  Ryan Pratama Pangestu Lo

import UIKit

// ReservationTVC is a CocoaTouch file of type UITableViewCell
class ReservationTVC: UITableViewCell {
    // By connecting all cell contects and setting the cell to be of type ReservationTVC, we can access them similar to class attributes
    @IBOutlet weak var reservedEventImageView: UIImageView!
    @IBOutlet weak var reservedEventNameLabel: UILabel!
    @IBOutlet weak var reservedEventDateLabel: UILabel!
    @IBOutlet weak var reservedEventTimeLabel: UILabel!
    @IBOutlet weak var reservedEventLocationLabel: UILabel!
    @IBOutlet weak var reservedTicketsLabel: UILabel!
    @IBOutlet weak var viewQRButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
