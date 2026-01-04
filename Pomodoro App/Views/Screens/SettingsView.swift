//
//  SettingsView.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//

import SwiftUI

struct SettingsView: View {
    @State private var workMinutes: Int = PomodoroSettings.workDurationInMinutes()
    @State private var breakMinutes: Int = PomodoroSettings.breakDurationInMinutes()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    // Work Duration
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Work Duration")
                            .font(.headline)
                        
                        HStack {
                            Stepper(
                                value: $workMinutes,
                                in: 1...120,
                                step: 1
                            ) {
                                Text("\(workMinutes) minute\(workMinutes == 1 ? "" : "s")")
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                    
                    // Break Duration
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Break Duration")
                            .font(.headline)
                        
                        HStack {
                            Stepper(
                                value: $breakMinutes,
                                in: 1...60,
                                step: 1
                            ) {
                                Text("\(breakMinutes) minute\(breakMinutes == 1 ? "" : "s")")
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                } header: {
                    Text("Timer Settings")
                } footer: {
                    Text("Adjust the duration for work and break sessions. Changes take effect on the next timer start.")
                        .font(.caption)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        saveSettings()
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }
    
    private func saveSettings() {
        PomodoroSettings.setWorkDuration(minutes: workMinutes)
        PomodoroSettings.setBreakDuration(minutes: breakMinutes)
    }
}

#Preview {
    SettingsView()
}

