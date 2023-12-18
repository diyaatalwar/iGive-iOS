//
//  donatePopupViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 23/11/23.
//

import UIKit
import FirebaseDatabaseInternal

class donatePopupViewController: UIViewController {
    
//    func didTapButton(with data: Organization) {
//        print(data)
//        donatePopupTitle?.text = data.title
//        donatePopupGoal?.text = data.goal
//        donatePopupDescription?.text = data.description
//    }
    
    var titleLabel: String = ""
    var goalLabel: String = ""
    var descriptionLabel: String = ""
    var progress: String = ""
    var id: DataSnapshot = DataSnapshot.init()
    
    @IBOutlet var donatePopupTitle: UILabel!
    
    @IBOutlet var donatePopupGoal: UILabel!
    
    @IBOutlet var donatePopupDescription: UILabel!
    
    @IBOutlet var progressView: UIProgressView!
    
//    @IBOutlet var donatePopupTitle: UILabel!
//    @IBOutlet var donatePopupGoal: UILabel!
//    @IBOutlet var donatePopupDescription: UILabel!
    
    
    @IBOutlet var amountSelectionButton: UIButton!
    
    
    @IBOutlet var donateButton: UIButton!
    
    
//    @IBOutlet var backButton: UIButton!
//    
//    @IBOutlet var amountSelectionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        donatePopupTitle.text = titleLabel
        donatePopupGoal.text = goalLabel
        donatePopupDescription.text = descriptionLabel
        
        let goal: Int = Int(self.goalLabel) ?? 100000
        let prog: Int = Int(self.progress) ?? 100000
        
        progressView.setProgress(Float(0.45), animated: true)
        
        setUpAmountButton()
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    func setUpAmountButton() {
        let popUpButtonClosure = { (action: UIAction) in
                print("Pop-up action")
            }
                    
            amountSelectionButton.menu = UIMenu(children: [
                UIAction(title: "₹500", handler: popUpButtonClosure),
                UIAction(title: "₹1000", handler: popUpButtonClosure),
                UIAction(title: "₹3000", handler: popUpButtonClosure),
                UIAction(title: "₹5000", handler: popUpButtonClosure)
            ])
            amountSelectionButton.showsMenuAsPrimaryAction = true
        
        amountSelectionButton.setTitle("Choose Amount", for: .normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "donateButtonClicked" {
            let vc = segue.destination as! donationConfirmationViewController
            
            vc.titleLabel = donatePopupTitle.text!
            
            vc.amount = amountSelectionButton.currentTitle!
            
            amountSelectionButton.setTitle("Choose Amount", for: .normal)
        }
    }
    
    @IBAction func donateButtonClicked(_ sender: UIButton) {
        var amount = amountSelectionButton.currentTitle
        if amount == "₹500"{
            progressView.setProgress(Float(progressView.progress + 0.05), animated: true)
        } else if amount == "₹1000"{
            progressView.setProgress(Float(progressView.progress + 0.1), animated: true)
        } else if amount == "₹3000"{
            progressView.setProgress(Float(progressView.progress + 0.2), animated: true)
        }
        else {
            progressView.setProgress(Float(progressView.progress + 0.3), animated: true)
        }
        
//        var ref:DatabaseReference
//        if titleLabel.contains("@"){
//            ref = Database.database().reference().child("Requests")
//        } else {
//            ref = Database.database().reference().child("Organization")
//        }
//        
//        var total = 0
//        if let chosenAmt = Int(amountSelectionButton.currentTitle!) {
//            if let abc = Int(progress) {
//                total = chosenAmt + abc
//            }
//        }
//        
//        let data1 = ["progress": String(total)]
////        let data2 = ["description":desc]
////        let data3 = ["name":userEmail]
////        let data4 = ["goal":goal]
//        ref.child(id.key).setValue(data1){
//            (error,_) in
//            if let error = error{
//                print("\(error.localizedDescription)")
//            }
//            else{
//                print("Saved")
//                // reload if possible
//                
//            }
        }
        
//        progressView.setProgress(Float(total/goal), animated: true)
        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
