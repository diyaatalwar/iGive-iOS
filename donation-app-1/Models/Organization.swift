//
//  Organization.swift
//  donation-app-1
//
//  Created by Diya Talwar on 13/11/23.
//

import Foundation
import UIKit
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseDatabase

    struct Organization {
        var title: String
        var description: String
        var goal: String
    //    var theme: Theme? = nil
    //    var background: UIImage
        var location: String? = nil
        var category: String? = nil
        var progress: String? = nil
        var id: DataSnapshot? = nil
}

//let firebaseDataManager = FirebaseDataManager()
//
//// Call the fetchData method with a callback
//firebaseDataManager.fetchData { data in
//    // Use the retrieved data here
//    print("Data from Firebase: \(data)")
//    // Perform any other actions with the data
//}

extension Organization {
//    static var temp:[String:Any] = FirebaseDataManager.fetchData()
//    static let sampleData:[Organization] = []
    
    //static var org:[Organization] = []
    
    static let sampleData: [Organization] = /*fetchData()*/
    [
        Organization(title: "ABC",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                   goal: "₹2,000",
                    category: "Common"),
        Organization(title: "XYZ",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                   goal: "₹10,000",
                     category: "Common"),
        Organization(title: "National Corp.",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                   goal: "₹8,000",
                     category: "Common"),
        
    ]
}
