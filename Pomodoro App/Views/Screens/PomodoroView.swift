//
//  PomodoroView.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//

import SwiftUI

struct PomodoroView: View {
    @State private var timer: PomodoroTimer = {
        let workDuration = PomodoroSettings.workDuration
        let breakDuration = PomodoroSettings.breakDuration
        return PomodoroTimer(workInSeconds: workDuration, breakInSeconds: breakDuration)
    }()
    
    @State private var showNotificationWarning = false
    @State private var showSettings = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(white: 0.98),
                    Color(white: 0.95)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button(action: {
                        showSettings = true
                    }) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 22, weight: .medium))
                            .foregroundColor(.secondary)
                            .frame(width: 44, height: 44)
                            .background(Color.secondary.opacity(0.1))
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 16)
                }
                
                Spacer()
                
                VStack(spacing: 50) {
                    CircleTimer(
                        progress: timer.fractionPassed,
                        timeText: timer.secondsLeftString,
                        modeText: timer.mode.title
                    )
                    .id(timer.mode)
                    .transition(.asymmetric(
                        insertion: .scale(scale: 0.9).combined(with: .opacity),
                        removal: .scale(scale: 1.1).combined(with: .opacity)
                    ))
                    
                    HStack(spacing: 8) {
                        Circle()
                            .fill(timer.mode == .work ? 
                                  Color(red: 0.2, green: 0.6, blue: 0.9) : 
                                  Color(red: 0.3, green: 0.8, blue: 0.5))
                            .frame(width: 10, height: 10)
                        
                        Text(timer.mode.title.uppercased())
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.primary)
                            .tracking(1.5)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(
                        Capsule()
                            .fill(Color.secondary.opacity(0.1))
                    )
                    .animation(.easeInOut(duration: 0.3), value: timer.mode)
                    
                    HStack(spacing: 28) {
                        if timer.state == .idle {
                            CircleButton(
                                icon: "play.fill",
                                size: 76,
                                backgroundColor: Color(red: 0.3, green: 0.8, blue: 0.5)
                            ) {
                                timer.start()
                            }
                            .transition(.scale.combined(with: .opacity))
                        }
                        
                        if timer.state == .running {
                            CircleButton(
                                icon: "pause.fill",
                                size: 76,
                                backgroundColor: Color(red: 1.0, green: 0.6, blue: 0.2)
                            ) {
                                timer.pause()
                            }
                            .transition(.scale.combined(with: .opacity))
                        }
                        
                        if timer.state == .paused {
                            HStack(spacing: 28) {
                                CircleButton(
                                    icon: "play.fill",
                                    size: 76,
                                    backgroundColor: Color(red: 0.3, green: 0.8, blue: 0.5)
                                ) {
                                    timer.resume()
                                }
                                
                                CircleButton(
                                    icon: "stop.fill",
                                    size: 64,
                                    backgroundColor: Color(red: 0.95, green: 0.3, blue: 0.3)
                                ) {
                                    timer.reset()
                                }
                            }
                            .transition(.scale.combined(with: .opacity))
                        }
                    }
                    .animation(.spring(response: 0.4, dampingFraction: 0.7), value: timer.state)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    if showNotificationWarning {
                        NotificationDisabled {
                            openSettings()
                        }
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                }
                .padding(.horizontal, 32)
                
                Spacer()
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
                .onDisappear {
                    updateTimerWithSettings()
                }
        }
        .onAppear {
            checkNotifications()
            updateTimerWithSettings()
        }
        .onChange(of: timer.mode) { oldValue, newValue in
            // Light haptic when mode switches
            if timer.state == .idle {
                let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                impactFeedback.impactOccurred()
            }
        }
    }

    // MARK: - Helpers

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
    
    private func updateTimerWithSettings() {
        if timer.state == .idle {
            let workDuration = PomodoroSettings.workDuration
            let breakDuration = PomodoroSettings.breakDuration
            timer.updateDurations(workInSeconds: workDuration, breakInSeconds: breakDuration)
        }
    }
}

#Preview {
    PomodoroView()
}
