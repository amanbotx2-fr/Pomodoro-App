//
//  PomodoroView.swift.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//

import SwiftUI

struct PomodoroView: View {

    @State private var timer =
        PomodoroTimer(workInSeconds: 25 * 60, breakInSeconds: 5 * 60)

    @State private var showNotificationWarning = false

    var body: some View {
        VStack(spacing: 40) {

            // TIMER CIRCLE
            CircleTimer(
                progress: timer.fractionPassed,
                timeText: timer.secondsLeftString,
                modeText: timer.mode.title
            )

            // BUTTONS
            HStack(spacing: 24) {

                if timer.state == .idle {
                    CircleButton(
                        icon: "play.fill",
                        size: 72,
                        backgroundColor: .green
                    ) {
                        timer.start()
                    }
                }

                if timer.state == .running {
                    CircleButton(
                        icon: "pause.fill",
                        size: 72,
                        backgroundColor: .orange
                    ) {
                        timer.pause()
                    }
                }

                if timer.state == .paused {
                    CircleButton(
                        icon: "play.fill",
                        size: 72,
                        backgroundColor: .green
                    ) {
                        timer.resume()
                    }
                }

                if timer.state != .idle {
                    CircleButton(
                        icon: "stop.fill",
                        size: 56,
                        backgroundColor: .red
                    ) {
                        timer.reset()
                    }
                }
            }

            // NOTIFICATION WARNING
            if showNotificationWarning {
                NotificationDisabled {
                    openSettings()
                }
            }
        }
        .padding()
        .onAppear {
            checkNotifications()
        }
    }

    // MARK: Helpers

    private func checkNotifications() {
        PomodoroNotification.checkAuthorization { allowed in
            DispatchQueue.main.async {
                showNotificationWarning = !allowed
            }
        }
    }

    private func openSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        UIApplication.shared.open(url)
    }
}

#Preview {
    PomodoroView()
}
