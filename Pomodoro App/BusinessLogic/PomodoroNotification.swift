//
//  PomodoroNotification.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//

import Foundation
import UserNotifications

class PomodoroNotification {

    static func checkAuthorization(completion: @escaping (Bool) -> Void) {
        let notificationCenter = UNUserNotificationCenter.current()

        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                completion(true)

            case .notDetermined:
                // First time - ask for permission
                notificationCenter.requestAuthorization(
                    options: [.alert, .badge, .sound]
                ) { allowed, _ in
                    completion(allowed)
                }

            default:
                // Permission denied or restricted
                completion(false)
            }
        }
    }

    static func scheduleNotification(
        seconds: TimeInterval,
        title: String,
        body: String
    ) {
        let notificationCenter = UNUserNotificationCenter.current()

        // Clear any existing notifications first
        notificationCenter.removeAllDeliveredNotifications()
        notificationCenter.removeAllPendingNotificationRequests()

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: seconds,
            repeats: false
        )

        let request = UNNotificationRequest(
            identifier: "pomodoro-notification",
            content: content,
            trigger: trigger
        )

        notificationCenter.add(request)
    }
}
