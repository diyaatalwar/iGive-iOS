//
//  Organisations.swift
//  donation-app-1
//
//  Created by Diya Talwar on 24/11/23.
//

import Foundation
import UIKit
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseDatabase
//struct Organization {
//    var title: String
//    var description: String
//    var goal: String
////    var theme: Theme? = nil
////    var background: UIImage
//    var location: String? = nil
//    var category: String? = nil
//}
class FirebaseDataManager {
    static var dataHolder:[Organization] = []
    // Create a reference to the Firestore database
    
     
     // Function to fetch data from the Realtime Database
    static func fetchData() -> [String:Any] {
        let database = Database.database()
         let dataReference = database.reference().child("Users")
        let value:[String:Any] = [:]
         // Observe for changes in the data
         dataReference.observeSingleEvent(of: .value) { (snapshot) in
             // Check if the snapshot has data
             guard let value = snapshot.value as? [String: Any] else {
                 print("No data found.")
                 return
             }

             // Process the data
             print("Data from Firebase: \(value)")
             
         }
        return value
     }
    
    // Function to fetch data from Firestore
//    static func fetchData()->[Organization] {
//        // Reference to a specific collection in Firestore
//        let db = Firestore.firestore()
//        let collectionReference = db.collection("Organisations")
//        print(collectionReference)
//        // Use getDocuments to fetch the documents in the collection
//        collectionReference.getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Hello1")
//                print("Error getting documents: \(error.localizedDescription)")
//            } else {
//                print("Hello2")
//                // Check if there are documents in the query snapshot
//                if let documents = querySnapshot?.documents {
//                    print("Hello3")
//                    for document in documents {
//                        // Access data using document.data() which returns a dictionary
//                        let data = document.data()
//                        let name = data["Name"]
//                        let desc = data["description"]
//                        let goal = data["goal"]
//                        let location = data["Location"]
//                        let organisation = Organization(title: name as! String, description: desc as! String, goal: goal as! String)
//                        print(organisation)
//                        dataHolder.append(organisation)
//                        print("Document ID: \(document.documentID), Data: \(data)")
//                    }
//                }
//            }
//        }
//        return dataHolder
//    }
    
}
