//
//  PomodoroAudio.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//

import Foundation
import AVFoundation

enum PomodoroAudioSounds {
    case done
    case tick

    var resource: String {
        switch self {
        case .done: return "bell.wav"
        case .tick: return "tick.wav"
        }
    }
}

class PomodoroAudio {
    private var audioPlayer: AVAudioPlayer?

    func play(_ sound: PomodoroAudioSounds) {
        let path = Bundle.main.path(forResource: sound.resource, ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}
