//
//  donationConfirmationViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 26/11/23.
//

import UIKit

class donationConfirmationViewController: UIViewController {
    
    var amount: String = ""
    var titleLabel: String = ""

    @IBOutlet var donationConfirmationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        donationConfirmationLabel.text = "Thank you for your donation.\nYou have donated an amount of \(self.amount) to \(self.titleLabel)!"
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
