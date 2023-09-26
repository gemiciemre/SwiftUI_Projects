//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Emre Gemici on 26.09.2023.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String , type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
        }catch{
            print("ERROR: Could not find and play the sound file!")
        }
    }
}
