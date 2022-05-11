//
//  EventsTVC.swift
//  UTS-Showcase
//
//  Created by Adrian Crespo on 5/11/22.
//

import UIKit

class EventsTVC: UITableViewCell {

    @IBOutlet weak var eventView: UIView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
