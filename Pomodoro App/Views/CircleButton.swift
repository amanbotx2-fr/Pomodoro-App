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
    
    @State private var isPressed = false

    var body: some View {
        Button(action: {
            // Haptic feedback
            let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
            impactFeedback.impactOccurred()
            
            action()
        }) {
            Image(systemName: icon)
                .font(.system(size: size * 0.45, weight: .semibold))
                .foregroundColor(.white)
                .frame(width: size, height: size)
                .background(backgroundColor)
                .clipShape(Circle())
                .shadow(color: backgroundColor.opacity(0.4), radius: isPressed ? 8 : 12, x: 0, y: isPressed ? 2 : 4)
                .scaleEffect(isPressed ? 0.95 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    if !isPressed {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPressed = true
                        }
                    }
                }
                .onEnded { _ in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isPressed = false
                    }
                }
        )
    }
}

#Preview {
    CircleButton(
        icon: "play.fill",
        size: 80,
        backgroundColor: .green
    ) {}
}
