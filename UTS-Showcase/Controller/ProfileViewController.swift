//
//  ProfileViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 7/5/22.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var studentNoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.text = currentAccount.name
        //hides the label if notAStudent is true
        if (notAStudent == false) {
            studentNoLabel.isHidden = false
            studentNoLabel.text = "Student Number: \(currentAccount.id)"
        } else {
            studentNoLabel.isHidden = true
        }
    }
    
    @IBAction func logout(_ sender: UIButton) {
        //reset notAStudent bool
        notAStudent = false
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavigationController = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController")
        
        // To get SceneDelegate object and call the function to change to login page
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavigationController)
    }
    
}
