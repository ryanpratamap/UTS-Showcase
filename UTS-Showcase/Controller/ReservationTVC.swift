//
//  ReservationTVC.swift
//  UTS-Showcase
//
//  Created by Michele Paulosky on 5/13/22.
//

import UIKit

class ReservationTVC: UITableViewCell {
    
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
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
