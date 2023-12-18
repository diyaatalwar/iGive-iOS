//
//  Request.swift
//  donation-app-1
//
//  Created by Diya Talwar on 24/11/23.
//

import Foundation

struct Request {
    var user: String
    var description: String
    var goal: String
//    var theme: Theme? = nil
//    var background: UIImage
    var location: String? = nil
    var category: String? = nil
}

extension Request {
    static let sampleData: [Request] =
    [
        Request(user: "abc12",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                   goal: "₹2,000",
                    category: "Common"),
        Request(user: "defNeedMoney",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                   goal: "₹10,000",
                    category: "Common"),
        Request(user: "helpMe321",
                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                   goal: "₹5,000",
                    category: "Common"),
        
    ]
}
