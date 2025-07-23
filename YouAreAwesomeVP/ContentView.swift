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
    @State private var messageNumber: Int = -1
    @State private var imageName: String = ""
    @State private var imageNumber: Int = -1
    @State private var soundNumber: Int = -1
    @State private var soundIsOn: Bool = true
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
            
            Spacer(minLength: 50)
            
            HStack {
                Text("Sound On:")
                    .font(.title3)
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        stopSound()
                    }
                
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
                    
                    messageNumber = nonRepeatingRandomInt(lastNumber: messageNumber, upperBounds: messages.count)
                    message = messages[messageNumber]
                    imageNumber = nonRepeatingRandomInt(lastNumber: imageNumber, upperBounds: (numberOfImages - 1))
                    imageName = "image\(imageNumber)"
                    soundNumber = nonRepeatingRandomInt(lastNumber: soundNumber, upperBounds: (numberOfSounds - 1))
                    stopSound()
                    if soundIsOn {
                        playSound(soundName: "sound\(soundNumber)")
                    }
                    
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.blue)
                
                Spacer()
            }
            
        }
        .padding()
        
    }
    
    func stopSound() {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
    }
    func nonRepeatingRandomInt(lastNumber: Int, upperBounds: Int) -> Int {
        var randomNumber: Int
        repeat {
            randomNumber = Int.random(in: 0..<upperBounds)
        } while randomNumber == lastNumber
        return randomNumber
    }
    
    func playSound(soundName: String) {
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
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
