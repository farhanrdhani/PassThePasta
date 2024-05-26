//
//  MusicManager.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 21/05/24.
//

import Foundation
import AVFoundation

class MusicManager {
    static let shared = MusicManager()
    var player: AVAudioPlayer?

    private init() {}

    func playBackgroundMusic() {
        if let url = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.numberOfLoops = -1 // Loop indefinitely
                player?.play()
            } catch {
                print("Error loading and playing music: \(error.localizedDescription)")
            }
        }
    }
    
    func stopBackgroundMusic() {
        player?.stop()
    }
    
    func playTutorialMusic() {
        if let url = Bundle.main.url(forResource: "tutorialMusic", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.numberOfLoops = -1 // Loop indefinitely
                player?.play()
            } catch {
                print("Error loading and playing music: \(error.localizedDescription)")
            }
        }
    }

    func stopTutorialMusic() {
        player?.stop()
    }
}
