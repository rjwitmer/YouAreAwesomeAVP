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
    @State private var message = "I am a Swift Programmer!"
    var body: some View {
        
        VStack {
            //            Model3D(named: "Scene", bundle: realityKitContentBundle)
            //                .padding(.bottom, 50)
            Spacer()
            
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .frame(width: 200, height: 200)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)

            Spacer()
            
            HStack {
                Button("Awesome") {
                    message = "Awesome!"
                }

                Button("Great") {
                    message = "Great!"
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
