//
//  adminLoginViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 27/11/23.
//

import UIKit
import Firebase
import FirebaseAuth
class adminLoginViewController: UIViewController {

    @IBOutlet var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Looks for single or multiple taps.
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var email: UITextField!
    @IBAction func unwindToAdminLogin
    (_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparaon before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func nextButtonAction(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: email.text!, password: passwordTextField.text!){
            result,error in
             if error != nil{
                print(error!.localizedDescription)
                
            }
            else {
                self.performSegue(withIdentifier: "adminLoginSegue", sender: sender)
            }
        }
    }
}
