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
    
    // Mode-based colors
    private var progressColor: Color {
        modeText.lowercased() == "work" ? Color(red: 0.2, green: 0.6, blue: 0.9) : Color(red: 0.3, green: 0.8, blue: 0.5)
    }
    
    private var modeColor: Color {
        modeText.lowercased() == "work" ? Color(red: 0.2, green: 0.6, blue: 0.9) : Color(red: 0.3, green: 0.8, blue: 0.5)
    }

    var body: some View {
        ZStack {
            // Background ring
            Circle()
                .stroke(
                    Color.gray.opacity(0.15),
                    lineWidth: 16
                )

            // Progress ring
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    progressColor,
                    style: StrokeStyle(
                        lineWidth: 16,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.5), value: progress)
                .shadow(color: progressColor.opacity(0.3), radius: 8, x: 0, y: 0)

            // Center text
            VStack(spacing: 8) {
                Text(timeText)
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                    .contentTransition(.numericText())
                    .animation(.easeInOut(duration: 0.3), value: timeText)

                Text(modeText.uppercased())
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(modeColor)
                    .tracking(2)
            }
        }
        .frame(width: 280, height: 280)
        .animation(.easeInOut(duration: 0.4), value: modeText)
    }
}

#Preview {
    CircleTimer(
        progress: 0.65,
        timeText: "10:32",
        modeText: "Work"
    )
}
