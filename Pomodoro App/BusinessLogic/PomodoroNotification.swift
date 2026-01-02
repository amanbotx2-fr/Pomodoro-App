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
            print(" Authorization status:", settings.authorizationStatus)

            switch settings.authorizationStatus {

            case .authorized:
                print(" Already authorized")
                completion(true)

            case .notDetermined:
                print(" REQUESTING PERMISSION")
                notificationCenter.requestAuthorization(
                    options: [.alert, .badge, .sound]
                ) { allowed, _ in
                    print("Permission result:", allowed)
                    completion(allowed)
                }

            default:
                print(" Permission denied or restricted")
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

        // remove all notifications
        notificationCenter.removeAllDeliveredNotifications()
        notificationCenter.removeAllPendingNotificationRequests()

        // content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        // trigger
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: seconds,
            repeats: false
        )

        // request
        let request = UNNotificationRequest(
            identifier: "pomodoro-notification",
            content: content,
            trigger: trigger
        )

        // add notification
        notificationCenter.add(request)
    }
}
