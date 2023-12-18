//
//  GreetingView.swift
//  donation-app-1
//
//  Created by Diya Talwar on 14/11/23.
//

import SwiftUI

// view modifier
struct CardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color("CardBackground"))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 4)
    }
}

// view extension for better modifier access
extension View {
    func cardBackground() -> some View {
        modifier(CardBackground())
    }
}

struct GreetingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hi, User!").font(.headline)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
        }.padding()
        
    }
}

#Preview {
    GreetingView()
}
