//
//  PlaySound.swift
//  Learn by Doing
//
//  Created by Anca Arhip on 18.11.2022.
//

import Foundation
import AVFoundation

// MARK: - AUDIOPLAYER

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file")
        }
    }
}
