//
//  AudioPlayer.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//

import SwiftUI

struct AudioPlayerDemo: View {

    var audioPlayer = PomodoroAudio()

    var body: some View {
        VStack {
            Button("play done") {
                audioPlayer.play(.done)
            }

            Button("play tick") {
                audioPlayer.play(.tick)
            }
        }
    }
}

#Preview {
    AudioPlayerDemo()
}
