//
//  homeViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 14/11/23.
//

import UIKit
import SwiftUI
import FirebaseDatabaseInternal
import FirebaseAuth

class homeViewController: UIViewController {
    
    let currentUser = Auth.auth().currentUser?.email
    
    var featuredOrganizations: [Organization] = [] {
        didSet {
            let contentView = SearchView(organizations: self.featuredOrganizations)
            let hostingController = UIHostingController(rootView: contentView)
            
            //
            // Add the hosting controller's view to your view hierarchy
            addChild(hostingController)
            view.addSubview(hostingController.view)
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
                hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
            hostingController.didMove(toParent: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "gradient.png")!)
        fetchData()
    }
    
    func fetchData() {
        self.featuredOrganizations.removeAll()
        let dataReference = Database.database().reference().child("Organization")

        // Observe for changes in the data
        dataReference.observeSingleEvent(of: .value) { snapshot in
            
            for userSnapshot in snapshot.children {
                let userAppointmentsSnapshot = userSnapshot as? DataSnapshot
                let name = userAppointmentsSnapshot!.childSnapshot(forPath: "name").value as! String
                let description = userAppointmentsSnapshot!.childSnapshot(forPath: "description").value as! String
                let goal = userAppointmentsSnapshot!.childSnapshot(forPath: "goal").value as? String

                let org = Organization(title: name, description: description, goal: goal ?? "0")
                
                let objects = self.featuredOrganizations.filter {
                    $0.title == org.title
                }
                
                if objects.isEmpty {
                    self.featuredOrganizations.append(org)
                }
                
                print(self.featuredOrganizations)
            }
        }

    }

}
