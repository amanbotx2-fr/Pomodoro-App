# Pomodoro Timer App

A clean, distraction-free Pomodoro timer app for iOS built with SwiftUI. Stay focused with customizable work and break sessions, beautiful animations, and helpful notifications.

## Features

- **Customizable Timer Durations** - Set your own work (1-120 minutes) and break (1-60 minutes) durations
- **Visual Progress Indicator** - Circular timer with smooth animations showing your progress
- **Mode-Based Design** - Color-coded visuals that change between work (blue) and break (green) modes
- **Notifications** - Get notified when your timer finishes, even if the app is in the background
- **Audio Feedback** - Bell sound plays when a session completes
- **Haptic Feedback** - Subtle vibrations for button interactions and mode switches
- **Persistent Settings** - Your timer preferences are saved and restored automatically
- **Modern UI** - Clean, minimal interface with smooth transitions and animations

## Tech Stack

- **SwiftUI** - Modern declarative UI framework
- **Swift** - Programming language
- **UserNotifications** - For timer completion alerts
- **AVFoundation** - For audio playback
- **UserDefaults** - For settings persistence

## Folder Structure

```
Pomodoro App/
├── BusinessLogic/
│   ├── PomodoroTimer.swift       # Core timer logic and state management
│   ├── PomodoroAudio.swift       # Audio playback handling
│   ├── PomodoroNotification.swift # Notification permissions and scheduling
│   └── PomodoroSettings.swift    # Settings persistence with UserDefaults
│
├── Views/
│   ├── Screens/
│   │   ├── PomodoroView.swift    # Main timer screen
│   │   └── SettingsView.swift    # Settings screen for customizing durations
│   ├── CircleTimer.swift         # Circular progress indicator component
│   ├── CircleButton.swift        # Reusable circular button component
│   └── NotificationDisabled.swift # Notification permission warning UI
│
├── Sounds/
│   ├── bell.wav                  # Completion sound
│   └── tick.wav                  # Tick sound (currently disabled)
│
├── ContentView.swift             # Root view
└── Pomodoro_AppApp.swift         # App entry point
```

## How to Run Locally

1. **Prerequisites**
   - macOS with Xcode installed (latest version recommended)
   - iOS Simulator or a physical iOS device running iOS 14.0 or later

2. **Setup**
   - Clone this repository
   - Open `Pomodoro App.xcodeproj` in Xcode
   - Select your target device or simulator
   - Build and run the project (⌘R)

3. **First Launch**
   - The app will request notification permissions on first launch
   - Grant permissions to receive alerts when timers complete
   - Default timer is set to 25 minutes work, 5 minutes break

4. **Using the App**
   - Tap the play button to start your work session
   - The circular timer shows your progress
   - Tap pause to pause, or stop to reset
   - When the timer completes, it automatically switches to break mode
   - Tap the gear icon to customize work and break durations

## Screenshots / Demo

The app features a clean, focused interface with:
- Large circular timer showing time remaining
- Mode indicator badge (WORK/BREAK) with color coding
- Intuitive control buttons (play, pause, stop)
- Smooth animations throughout

## Future Improvements

- **Session Statistics** - Track completed Pomodoros and daily/weekly totals
- **Long Break Support** - Add longer break periods after multiple work sessions
- **Custom Sound Selection** - Let users choose from different completion sounds
- **Dark Mode Enhancements** - Optimize colors and contrast for dark appearance

## Author

I built this app to help improve my own focus and productivity. The Pomodoro Technique has been a game-changer for me, and I wanted a simple, beautiful app that doesn't get in the way.

Feel free to fork, modify, or use this project for your own purposes!

