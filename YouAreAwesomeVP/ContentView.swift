//
//  ContentView.swift
//  YouAreAwesomeVP
//
//  Created by Bob Witmer on 2025-07-09.
//

import SwiftUI
import RealityKit
import RealityKitContent
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var message: String = ""
    @State private var lastMessageNumber: Int = -1
    @State private var imageName: String = ""
    @State private var lastImageNumber: Int = -1
    @State private var lastSoundNumber: Int = -1
    let numberOfImages: Int = 22    // images named image0 -> image21
    let numberOfSounds: Int = 6    // sounds named sound0 => sound5
    
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Spacer(minLength: 50 )
            
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
                
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0..<messages.count-1)
                } while messageNumber == lastMessageNumber
                
                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 0..<numberOfImages)
                } while imageNumber == lastImageNumber
                
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 1..<numberOfSounds)
                } while soundNumber == lastSoundNumber

                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                let soundName:String = "sound\(soundNumber)"
                lastSoundNumber = soundNumber
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 ERROR: Could not read sound file named \(soundName)")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("😡 ERROR: -> \(error.localizedDescription) creating AVAudioPlayer")
                }
                
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
