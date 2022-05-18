//
//  LoginViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 3/5/22.
//
//  Edited by:
//  Adrian Crespo Sanjines
//  Elizabeth Kim
//  Michele Paulosky
//  Ryan Pratama Pangestu Lo

import UIKit

class LoginViewController: UIViewController {
    // Connections
    @IBOutlet weak var studentIDTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Users will activate switch when they do not have a student ID
    @IBAction func studentNoSwitch(_ sender: UISwitch) {
        if sender.isOn { // On tapping switch
            studentIDTextField.isEnabled = false   // Disable the StudentID text field
            currentAccount.isStudent = false       // Set account type
        } else {
            studentIDTextField.isEnabled = true
            currentAccount.isStudent = true
        }
    }
    
    // Login button pressed
    @IBAction func login(_ sender: UIButton) {
        // Write data only at login
        // This acts as a "Reset" of event data displayed on EventTableViewController
        UDList.shared.writeEvents()
        
        // Validate ID and/or name
        do {
            try isUsernameValid(nameTextField.text!)
            
            if (currentAccount.isStudent) {
                // Only validate StudentID if the account type is student
                try isStudentIDValid(studentIDTextField.text!)
                currentAccount.id = studentIDTextField.text!
            }
            currentAccount.name = nameTextField.text!.capitalizingFirstLetter()
            
            // Instantiate TabBar Controller
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
        
            // To get SceneDelegate object and call the function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
        // Catch any invalid user's ID and name inputs and display error messages
        catch invalidNameError.invalidChars {
            displayAlert("There are no special characters allowed in your name")
        } catch invalidNameError.invalidLength {
            displayAlert("Please enter characters between 2-20 for your name")
        } catch invalidStudentIDError.invalidChars {
            displayAlert("Please enter only numbers for your Student ID")
        } catch invalidStudentIDError.invalidLength {
            displayAlert("Please enter 8 numbers for your Student ID")
        } catch {
            displayAlert("Unexpected Error")
        }
    }
    
    // Custom error objects
    enum invalidNameError: Error {
        case invalidChars  // Only characters
        case invalidLength // Between 3-19
    }
    enum invalidStudentIDError: Error {
        case invalidChars  // Only numbers
        case invalidLength // Only 8 characters
    }
    
    // Display error message
    func displayAlert(_ errorMsg: String) {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: "Error", message: errorMsg, preferredStyle: .alert)
        
        // Create OK button with action handlder
        let ok = UIAlertAction(title: "OK", style: .cancel) { (action) -> Void in
            print("OK button tapped")
        }
        
        // Add OK button to dialog message
        dialogMessage.addAction(ok)
    
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil)
    }

    /*
     Function to validate user's name
     */
    func isUsernameValid(_ name: String, _ forbiddenChars: String = "@#$%&*()^<>!±_,.1234567890", _ lengthRange: Range<Int> = 2..<20) throws {
        guard  lengthRange ~= name.count else {
            throw invalidNameError.invalidLength
        }
        guard name.allSatisfy({ !forbiddenChars.contains($0)}) else {
            throw invalidNameError.invalidChars
        }
    }
    
    /*
     Function to validate student ID
     */
    func isStudentIDValid(_ number: String, _ forbiddenChars: String = "@#$%&*()^<>!±_abcdefghijklmnopqrstuvwxyz", _ length: Int = 8) throws {
        guard  length ~= number.count else {
            throw invalidStudentIDError.invalidLength
        }
        guard number.allSatisfy({ !forbiddenChars.contains($0)}) else {
            throw invalidStudentIDError.invalidChars
        }
    }
}

/*
 Capitalize first letter of name
 */
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
