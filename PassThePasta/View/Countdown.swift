//
//  Countdown.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 22/05/24.
//

import SwiftUI

struct Countdown: View {
    @State var scale3:Double = 1
    @State var opacity3:Double = 0
    
    @State var scale2:Double = 1
    @State var opacity2:Double = 0
    
    @State var scale1:Double = 1
    @State var opacity1:Double = 0
    
    var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [.tealBackground, .blueBackground]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            Image("MAINBACK_PTP")
                .resizable()
            
            VStack {
                Image("COUNT_1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenHeight*1/3)
                    .padding()
                    .scaleEffect(scale1)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .opacity(opacity1)
            VStack {
                Spacer()
                Image("COUNT_2")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenHeight*1/3)
                    .padding()
                    .scaleEffect(scale1)
                    .scaleEffect(scale2)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .opacity(opacity2)
            VStack {
                Spacer()
                Image("COUNT_3")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenHeight*1/3)
                    .padding()
                    .scaleEffect(scale1)
                    .scaleEffect(scale3)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .opacity(opacity3)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            Task {
                // 3
                withAnimation(Animation.linear(duration: 0.2)) {
                    opacity3 = 1
                }
                withAnimation(Animation.easeOut(duration: 1)) {
                    scale3 = 1.5
                }
                try? await Task.sleep(for: .seconds(1))
                
                // 2
                withAnimation(Animation.linear(duration: 0.2)) {
                    opacity3 = 0
                    opacity2 = 1
                }
                withAnimation(Animation.easeOut(duration: 1)) {
                    scale2 = 1.5
                }
                try? await Task.sleep(for: .seconds(1))
                
                // 1
                withAnimation(Animation.linear(duration: 0.2)) {
                    opacity2 = 0
                    opacity1 = 1
                }
                withAnimation(Animation.easeOut(duration: 1)) {
                    scale1 = 1.5
                }
                try? await Task.sleep(for: .seconds(1))
                
                
                // 0
                withAnimation(Animation.linear(duration: 0.2)) {
                    opacity1 = 0
                }
            }
        }
    }
}

#Preview {
    Countdown()
}
