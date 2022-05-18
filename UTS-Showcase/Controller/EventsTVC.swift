//
//  EventsTVC.swift
//  UTS-Showcase
//
//  Created by Adrian Crespo on 5/11/22.
//
//  Edited by:
//  Adrian Crespo Sanjines
//  Elizabeth Kim
//  Michele Paulosky
//  Ryan Pratama Pangestu Lo

import UIKit
//EventsTVC is a CocoaTouch file of type UITableViewCell
class EventsTVC: UITableViewCell {
    //By connecting all cell contects and setting the cell to be of type EventsTVC we can access them similar to class attributes
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
