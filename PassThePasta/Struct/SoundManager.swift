//
//  SoundManager.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 21/05/24.
//

import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    
    private var audioPlayer: AVAudioPlayer?
    
    func playSound(named soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else {
            print("Sound file not found.")
            print(soundName)
            return
        }
        print(url)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Failed to play sound: \(error.localizedDescription)")
        }
    }
}
