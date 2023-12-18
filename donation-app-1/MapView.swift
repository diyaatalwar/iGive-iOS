//
//  MapView.swift
//  donation-app-1
//
//  Created by Diya Talwar on 23/11/23.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        VStack {
            // Card content
            Text("Hello, SwiftUI!")
                .font(.title)
                .foregroundColor(.white)
                .padding()

            Spacer() // Add space to push content to the top

            // Card footer
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Text("Like")
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.blue)
        }
        .cornerRadius(10)
        .padding()
        .background(Color.gray)
    }
}

struct ContentView: View {
    var body: some View {
        List {
            MapView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
