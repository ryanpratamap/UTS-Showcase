//
//  LoginViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 3/5/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        do {
            try isValidUsername(nameTextField.text!)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
        
            // To get SceneDelegate object and call the function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
            
        } catch invalidNameError.invalidChars {
            displayAlert("There are no special characters allowed")
        } catch invalidNameError.invalidLength {
            displayAlert("Please enter characters between 2-20")
        } catch {
            displayAlert("Unexpected Error")
        }
    }
    
    
    enum invalidNameError: Error {
        case invalidChars //only characters please!
        case invalidLength //between 3-19 pls
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

    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if segue.identifier == "goToEvents" {
            let VC = segue.destination as! EventViewController
            VC.name = nameTextField.text!
        }*/
    //}
}
