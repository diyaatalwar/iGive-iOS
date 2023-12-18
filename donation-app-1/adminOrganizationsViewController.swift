//
//  adminOrganizationsViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 27/11/23.
//

import UIKit

class adminOrganizationsViewController: UIViewController {
    
    
    @IBOutlet var organizationName: UITextField!
    
    @IBOutlet var organizationDescription: UITextField!
    
    @IBOutlet var organizationGoal: UITextField!
    
    
    @IBOutlet var categorySelectionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "gradient1.png")!)
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
        categorySelectionButton.setTitle("Choose Category", for: .normal)
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "confirmationSegue" {
            let destinationVC = segue.destination as! confirmationViewController
            
            destinationVC.name = organizationName.text ?? ""
            destinationVC.goal = organizationGoal.text ?? ""
            destinationVC.desc = organizationDescription.text ?? ""
            destinationVC.category = categorySelectionButton.currentTitle ?? ""
            
            organizationName.text = ""
            organizationGoal.text = ""
            organizationDescription.text = ""
            categorySelectionButton.setTitle("Choose Amount", for: .normal)
            
        }
    }
    
    @IBAction func unwindToAddOrganizations(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
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
