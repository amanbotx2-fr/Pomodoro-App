//
//  CircleTimer.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//

import SwiftUI

struct CircleTimer: View {
    let progress: Double        // 0 → 1
    let timeText: String        // "25:00"
    let modeText: String        // "WORK" / "BREAK"

    var body: some View {
        ZStack {
            // Background ring
            Circle()
                .stroke(
                    Color.gray.opacity(0.2),
                    lineWidth: 14
                )

            // Progress ring
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.accentColor,
                    style: StrokeStyle(
                        lineWidth: 14,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.linear, value: progress)

            // Center text
            VStack(spacing: 6) {
                Text(timeText)
                    .font(.system(size: 42, weight: .bold, design: .rounded))

                Text(modeText.uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 260, height: 260)
    }
}

#Preview {
    CircleTimer(
        progress: 0.65,
        timeText: "10:32",
        modeText: "Work"
    )
}
