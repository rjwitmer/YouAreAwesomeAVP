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
    @State private var imageNumber = -1
    
    var body: some View {
        
        VStack {
            //            Model3D(named: "Scene", bundle: realityKitContentBundle)
            //                .padding(.bottom, 50)
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
             
            Button("Show Message") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                message = message == message1 ? message2 : message1
                
                imageNumber = imageNumber < 9 ? imageNumber + 1 : 0
                imageName = "image\(imageNumber)"

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
