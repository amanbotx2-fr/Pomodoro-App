//
//  NotificationDisabled.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//


import SwiftUI

struct NotificationDisabled: View {
    let enableAction: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "bell.slash.fill")
                .font(.system(size: 40))
                .foregroundColor(.orange)

            Text("Notifications Disabled")
                .font(.headline)

            Text("Enable notifications to get alerts when your timer finishes.")
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)

            Button("Enable Notifications", action: enableAction)
                .font(.subheadline)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .padding()
    }
}

#Preview {
    NotificationDisabled {}
}
