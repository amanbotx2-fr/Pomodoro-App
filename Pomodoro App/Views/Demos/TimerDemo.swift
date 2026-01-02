//
//  TimerDemo.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//

import SwiftUI

struct TimerDemo: View {

    @State private var timer = PomodoroTimer(
        workInSeconds: 10,
        breakInSeconds: 5
    )

    var body: some View {
        VStack(spacing: 16) {

            Text(timer.secondsLeftString)
                .font(.largeTitle)
                .monospacedDigit()

            Text(timer.mode.title.uppercased())
                .font(.headline)

            if timer.state == .idle {
                Button("Start") {
                    timer.start()
                }
            }

            if timer.state == .running {
                Button("Pause") {
                    timer.pause()
                }
            }

            if timer.state == .paused {
                Button("Resume") {
                    timer.resume()
                }
            }
        }
        .padding()
    }
}

#Preview {
    TimerDemo()
}
