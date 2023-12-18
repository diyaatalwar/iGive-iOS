//
//  SearchView.swift
//  donation-app-1
//
//  Created by Diya Talwar on 13/11/23.
//

import SwiftUI
import FirebaseAuth

// view modifier
//struct CardBackground: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .background(Color("CardBackground"))
//            .cornerRadius(10)
//            .shadow(color: Color.black.opacity(0.2), radius: 4)
//    }
//}

// view extension for better modifier access
//extension View {
//    func cardBackground() -> some View {
//        modifier(CardBackground())
//    }
//}


struct SearchView: View {
    let organizations: [Organization]
    let username: String = Auth.auth().currentUser?.email ?? "User"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .leading){
                Label(username, systemImage: "person.crop.circle.fill").font(.largeTitle)
                Text("Welcome to iGive.")
                Text("Make a difference today!")
            }.background(Image("gradient")).frame(maxWidth: .infinity, alignment: .leading)
        }.padding()
        
        VStack(alignment: .leading){
            Label("Featured organizations", systemImage: "building.2").font(.title).multilineTextAlignment(.leading)
        }.frame(maxWidth: .infinity, alignment: .leading).padding()
        
        List(organizations, id: \.title) { organization in
            CardView(organization: organization).background(Image("gradient"))
            Spacer()
            
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(organizations: Organization.sampleData)
    }
}
