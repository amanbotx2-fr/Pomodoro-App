//
//  NotificationDemo.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//



import SwiftUI

struct NotificationDemo: View {

    @State private var showWarning = false
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        VStack {
            Button("send notification") {
                PomodoroNotification.scheduleNotification(
                    seconds: 5,
                    title: "this is the title",
                    body: "Some message"
                )
            }

            if showWarning {
                VStack {
                    Text("Notifications are disabled")
                    Button("Enable") {
                        // later: open settings
                    }
                }
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                PomodoroNotification.checkAuthorization { authorized in
                    DispatchQueue.main.async {
                        showWarning = !authorized
                    }
                }
            }
        }
    }
}

#Preview {
    NotificationDemo()
}

