//
//  TypingTextView.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 18/05/24.
//
import SwiftUI

struct TypingTextView: View {
    let fullText: String
    @State private var displayedText: String = ""
    @State private var timer: Timer?

    var body: some View {
        Text(displayedText)
            .font(.custom("comfortaa-semibold", size: 24))
            .foregroundColor(Color("BlueTextColor"))
            .onAppear {
                startTypingAnimation()
            }
            .onDisappear {
                stopTypingAnimation()
            }
            
    }

    private func startTypingAnimation() {
        var currentIndex = 0
        stopTypingAnimation() // Ensure no existing timer is running
        timer = Timer.scheduledTimer(withTimeInterval: 0.025, repeats: true) { timer in
            if currentIndex < fullText.count {
                let index = fullText.index(fullText.startIndex, offsetBy: currentIndex)
                displayedText.append(fullText[index])
                currentIndex += 1
            } else {
                timer.invalidate()
            }
        }
    }

    private func stopTypingAnimation() {
        timer?.invalidate()
        timer = nil
    }
}
