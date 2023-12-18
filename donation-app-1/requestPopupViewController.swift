//
//  requestPopupViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 24/11/23.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseDatabaseInternal
class requestPopupViewController: UIViewController {
    @IBOutlet var categorySelectionButton: UIButton!
    
    @IBOutlet var goal: UITextField!
    
    @IBOutlet var descriptionText: UITextField!
    @IBOutlet var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Looks for single or multiple taps.
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
        setUpCategoryButton()
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func setUpCategoryButton() {
        let popUpButtonClosure = { (action: UIAction) in
                print("Pop-up action")
            }
                    
            categorySelectionButton.menu = UIMenu(children: [
                UIAction(title: "Healthcare", handler: popUpButtonClosure),
                UIAction(title: "Education", handler: popUpButtonClosure),
                UIAction(title: "Environment", handler: popUpButtonClosure),
                UIAction(title: "Miscellaneous", handler: popUpButtonClosure)
            ])
            categorySelectionButton.showsMenuAsPrimaryAction = true
        categorySelectionButton.setTitle("Choose Category", for: .normal)
        
    }
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        var i = 3
        var str = randomString(length: 10)
        var category:String = categorySelectionButton.currentTitle ?? ""
        var desc:String = descriptionText.text ?? ""
        var goal:String = goal.text ?? ""
        var ref:DatabaseReference
        let userEmail = Auth.auth().currentUser?.email
        ref = Database.database().reference().child("Requests")
        let data1 = ["category":category,"description":desc,"name":userEmail,"goal":goal]
//        let data2 = ["description":desc]
//        let data3 = ["name":userEmail]
//        let data4 = ["goal":goal]
        ref.child(str).setValue(data1){
            (error,_) in
            if let error = error{
                print("\(error.localizedDescription)")
            }
            else{
                print("Saved")
                
            }
        }
//        ref.child("req3").setValue(data2){
//            (error,_) in
//            if let error = error{
//                print("\(error.localizedDescription)")
//            }
//            else{
//                print("Saved")
//            }
//        }
//        ref.child("req3").setValue(data3){
//            (error,_) in
//            if let error = error{
//                print("\(error.localizedDescription)")
//            }
//            else{
//                print("Saved")
//            }
//        }
//        ref.child("req3").setValue(data4){
//            (error,_) in
//            if let error = error{
//                print("\(error.localizedDescription)")
//            }
//            else{
//                print("Saved")
//            }
//        }
        i+=1
        
        categorySelectionButton.setTitle("Choose Category", for: .normal)
    }
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
