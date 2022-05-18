//
//  ProfileViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 7/5/22.
//
//  Edited by:
//  Adrian Crespo Sanjines
//  Elizabeth Kim
//  Michele Paulosky
//  Ryan Pratama Pangestu Lo

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    // Connections
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var studentIDLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide the StudentID label if the user is not a student
        if (!currentAccount.isStudent) {
            studentIDLabel.isHidden = true
        } else {
            studentIDLabel.isHidden = false
            studentIDLabel.text = "Student ID: \(currentAccount.id)"
        }
        
        // Set name label
        nameLabel.text = "Name: \(currentAccount.name)"
    }
    
    // Logout button pressed
    @IBAction func logout(_ sender: UIButton) {
        // Reset isStudent variable
        currentAccount.isStudent = true
        
        // Redirect to Login Page
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavigationController = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavigationController)
    }
}
