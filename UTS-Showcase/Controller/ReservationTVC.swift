//
//  ReservationTVC.swift
//  UTS-Showcase
//
//  Created by Michele Paulosky on 5/13/22.
//

import UIKit

class ReservationTVC: UITableViewCell {
    @IBOutlet weak var EventName: UILabel!
    @IBOutlet weak var EventImgView: UIImageView!
    @IBOutlet weak var NumberofTickets: UILabel!
    @IBOutlet weak var EventCancelButton: UIButton!
    @IBOutlet weak var EventTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
