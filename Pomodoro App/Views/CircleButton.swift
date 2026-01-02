//
//  CircleButton.swift
//  Pomodoro App
//
//  Created by aman on 02/01/26.
//


import SwiftUI

struct CircleButton: View {
    let icon: String
    let size: CGFloat
    let backgroundColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: size * 0.45, weight: .semibold))
                .foregroundColor(.white)
                .frame(width: size, height: size)
                .background(backgroundColor)
                .clipShape(Circle())
                .shadow(radius: 6)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CircleButton(
        icon: "play.fill",
        size: 80,
        backgroundColor: .green
    ) {}
}
