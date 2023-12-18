//
//  profileViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 13/11/23.
//

import UIKit
import FirebaseAuth

class profileViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "gradient.png")!)
        
        let username = Auth.auth().currentUser?.email
        
        greetingLabel.text = "Hi, \(username ?? "User")"

        // Do any additional setup after loading the view.
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
