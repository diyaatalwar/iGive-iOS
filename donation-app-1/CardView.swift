//
//  CardView.swift
//  donation-app-1
//
//  Created by Diya Talwar on 13/11/23.
//

import SwiftUI


struct CardView: View {
    let organization: Organization
    var body: some View {
        VStack(alignment: .leading){
            Text(organization.title).font(.headline)
            Spacer()
            HStack(alignment: .top) {
                Label("\(organization.description)", systemImage: "building.2.crop.circle")
                Spacer()
                Label("\(organization.goal)", systemImage: "dollarsign.circle.fill" ).padding(.trailing, 20)
            }
        }.padding()
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var organization = Organization.sampleData[0]
    static var previews: some View {
        CardView(organization: organization).previewLayout(.fixed(width: 500, height: 300))
    }
}
