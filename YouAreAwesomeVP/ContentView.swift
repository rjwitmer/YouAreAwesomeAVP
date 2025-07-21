//
//  ContentView.swift
//  YouAreAwesomeVP
//
//  Created by Bob Witmer on 2025-07-09.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
//                .animation(.easeInOut(duration: 0.1), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
//                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message") {
                let messages: [String] = ["You are Awesome!",
                                          "You are Great!",
                                          "You are Fabulous",
                                          "You are Amazing!",
                                          "You are Incredible!",
                                          "You are Superb!",
                                          "You are Radiant!",
                                          "You are Fantastic!",
                                          "You are Skilled!",
                                          "You are Stunning!"]
                
                message = messages[Int.random(in: 0..<messages.count-1)]
                imageName = "image\(Int.random(in: 0...9))"
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
