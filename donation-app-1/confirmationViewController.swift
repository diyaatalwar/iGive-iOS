//
//  confirmationViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 27/11/23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabaseInternal
class confirmationViewController: UIViewController {
    
    var name: String = ""
    var desc: String = ""
    var goal: String = ""
    var category: String = ""

    @IBOutlet var detailsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsLabel.text = "Organization Name: \(self.name)\nDescription: \(self.desc)\nGoal: \(self.goal)\nCategory: \(self.category)"
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    
    
    @IBAction func yesButtonAction(_ sender: UIButton) {
        var str = randomString(length: 10)
        var category:String = category
        var desc:String = desc
        var goal:String = goal
        var ref:DatabaseReference
        ref = Database.database().reference().child("Organization")
        let data1 = ["category":category,"description":desc,"name":name,"goal":goal]
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
                self.dismiss(animated: true, completion: nil)
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
