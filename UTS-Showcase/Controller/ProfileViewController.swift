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
    @IBOutlet weak var studentIDLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide the StudentID label if the user is not a student
        if (currentAccount.notAStudent) {
            studentIDLabel.isHidden = true
        } else {
            studentIDLabel.isHidden = false
            studentIDLabel.text = "Student ID: \(currentAccount.id)"
        }
        
        // Set name label
        nameLabel.text = "Name: \(currentAccount.name)"
    }
    
    @IBAction func logout(_ sender: UIButton) {
        // Reset notAStudent variable
        currentAccount.notAStudent = false
        
        // Redirect to Login Page
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavigationController = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavigationController)
    }
    
}
