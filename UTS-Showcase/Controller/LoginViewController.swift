//
//  LoginViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 3/5/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var studentNoTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: UIButton) {
        //Write data only at login
        //This acts as a "Reset" of event data
        let udCurrentList = UDList()
        udCurrentList.writeEvents()
        
        do {
            try isValidUsername(nameTextField.text!)
            //need to link studentNoTextField IBlabel to the Main
            try isValidStudentNo(studentNoTextField.text!)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
        
            // To get SceneDelegate object and call the function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
            
        } catch invalidNameError.invalidChars {
            displayAlert("There are no special characters allowed in your name")
        } catch invalidNameError.invalidLength {
            displayAlert("Please enter characters between 2-20 for your name")
        } catch invalidStudentNo.invalidChars {
            displayAlert("Please enter only numbers for your Student Number")
        } catch invalidStudentNo.invalidLength {
            displayAlert("Please enter 8 numbers for your Student Number")
        } catch {
            displayAlert("Unexpected Error")
        }
    }
    
    
    enum invalidNameError: Error {
        case invalidChars //only characters please!
        case invalidLength //between 3-19
    }
    
    enum invalidStudentNo: Error {
        case invalidChars //only numbers
        case invalidLength //only 8 characters
    }

    func displayAlert(_ errorMsg: String) {
            // Declare Alert message
            let dialogMessage = UIAlertController(title: "Error", message: errorMsg, preferredStyle: .alert)
            
            // Create Ok button with action handlder
            let ok = UIAlertAction(title: "Ok", style: .cancel) { (action) -> Void in
                print("Cancel button tapped")
            }
            
            //Add OK and Cancel button to dialog message
            dialogMessage.addAction(ok)
        
            // Present dialog message to user
            self.present(dialogMessage, animated: true, completion: nil)
        }

    func isValidUsername(_ name: String, _ forbiddenChars: String = "@#$%&*()^<>!±_1234567890", _ lengthRange: Range<Int> = 2..<20) throws {
        guard  lengthRange ~= name.count else {
            throw invalidNameError.invalidLength
        }
        guard name.allSatisfy({ !forbiddenChars.contains($0)}) == true else {
            throw invalidNameError.invalidChars
        }
    }
    
    func isValidStudentNo(_ number: String, _ forbiddenChars: String = "@#$%&*()^<>!±_abcdefghijklmnopqrstuvwxyz", _ length: Int = 8) throws {
        guard  length ~= number.count else {
            throw invalidStudentNo.invalidLength
        }
        guard number.allSatisfy({ !forbiddenChars.contains($0)}) == true else {
            throw invalidStudentNo.invalidChars
        }
    }

    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if segue.identifier == "goToEvents" {
            let VC = segue.destination as! EventViewController
            VC.name = nameTextField.text!
        }*/
    //}
}
