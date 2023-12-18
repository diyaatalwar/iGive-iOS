//
//  ViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 13/11/23.
//

import UIKit
import Firebase
import FirebaseDatabaseInternal

class ViewController: UIViewController {
    
    var organisations: [Organization] = []
    
    
    @IBOutlet var logoImage: UIImageView!
    
    @IBOutlet var password: UITextField!
    @IBOutlet var email: UITextField!
 
    @IBOutlet var loginButton: UIButton!
    
    func toRegister(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){
            result,error in if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    
//    func toLogin() -> String?{
//        var str: String? = nil
//
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "gradient.png")!)
        
        //Looks for single or multiple taps.
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
        logoImage = UIImageView(image: self.resizeImage(image: UIImage(named: "Picture1.png")!, targetSize: CGSizeMake(200.0, 200.0)))
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    @IBAction func register(_ sender: UIButton) {
        toRegister()
    }

    @IBAction func login(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!){
            result,error in
             if error != nil{
                print(error!.localizedDescription)
                
            }
            else {
                self.performSegue(withIdentifier: "successful", sender: sender)
            }
        }
        
        
    }
    @IBOutlet var signupBUtton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "successful"{
            let tabBarController = segue.destination as! UITabBarController
            tabBarController.selectedIndex = 2
        }
        
    }
    
    @IBAction func unwindToLogin(unwindSegue: UIStoryboardSegue) {
    
    }
    
    
    
    

}

