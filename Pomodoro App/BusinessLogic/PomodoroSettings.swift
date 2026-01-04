//
//  PomodoroSettings.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//

import Foundation

class PomodoroSettings {
    private static let workDurationKey = "pomodoro_work_duration"
    private static let breakDurationKey = "pomodoro_break_duration"
    
    // Default values (in seconds)
    static let defaultWorkDuration: TimeInterval = 25 * 60  // 25 minutes
    static let defaultBreakDuration: TimeInterval = 5 * 60  // 5 minutes
    
    // MARK: - Work Duration
    static var workDuration: TimeInterval {
        get {
            let saved = UserDefaults.standard.double(forKey: workDurationKey)
            return saved > 0 ? saved : defaultWorkDuration
        }
        set {
            UserDefaults.standard.set(newValue, forKey: workDurationKey)
        }
    }
    
    // MARK: - Break Duration
    static var breakDuration: TimeInterval {
        get {
            let saved = UserDefaults.standard.double(forKey: breakDurationKey)
            return saved > 0 ? saved : defaultBreakDuration
        }
        set {
            UserDefaults.standard.set(newValue, forKey: breakDurationKey)
        }
    }
    
    // MARK: - Convenience Methods
    static func workDurationInMinutes() -> Int {
        return Int(workDuration / 60)
    }
    
    static func breakDurationInMinutes() -> Int {
        return Int(breakDuration / 60)
    }
    
    static func setWorkDuration(minutes: Int) {
        workDuration = TimeInterval(minutes * 60)
    }
    
    static func setBreakDuration(minutes: Int) {
        breakDuration = TimeInterval(minutes * 60)
    }
}

