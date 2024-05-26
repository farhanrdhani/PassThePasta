//
//  StartPage.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 17/05/24.
//

import SwiftUI

struct StartPage: View {
    @State var swing:Angle = Angle(degrees: -10)
    @State var floating:CGSize = CGSize(width: 0, height: -5)
    @State var breathScale:Double = 0.9
    @State private var isActive: Bool = false
    var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.tealBackground, .blueBackground]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                
                Image("MAINBACK_PTP")
                    .resizable()
                
                
                Image("PINTU_PTP")
                    .resizable()
                    .scaledToFit()
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image("LOGO_PTP")
                            .resizable()
                            .scaledToFit()
                            .frame(height: screenHeight*2/3)
                            .padding()
                            .offset(floating)
                            .rotationEffect(swing)
                            .onAppear {
                                let baseAnimation = Animation.easeInOut(duration: 10)
                                let repeated = baseAnimation.repeatForever(autoreverses: true)

                                withAnimation(repeated) {
                                    swing = Angle(degrees: 2)
                                }
                            }
                            .onAppear {
                                let baseAnimation2 = Animation.easeInOut(duration: 10)
                                let repeated2 = baseAnimation2.repeatForever(autoreverses: true)
                                
                                withAnimation(repeated2) {
                                    floating = CGSize(width: 0, height: 2)
                                }
                            }
                        
                        Spacer(minLength: 128)
                        
                        
                        NavigationLink(destination: {
                            TutorialStoryView()
                        }, label: {
                            Image("BUTTON_PTP")
                                .resizable()
                                .scaledToFit()
                                .frame(height: screenHeight/5)
                                .padding()
                            
                                .scaleEffect(breathScale)
                                .onAppear {
                                    let baseAnimation = Animation.spring(duration: 1)
                                    let repeated = baseAnimation.repeatForever(autoreverses: true)

                                    withAnimation(repeated) {
                                        breathScale = 1
                                    }
                                    
                                }
                        })
                        
                    }
                    .padding(80)
                }
                .padding()
                

                    
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .onAppear {
                            MusicManager.shared.playBackgroundMusic()
                        }
            
        }
        
    }
    
            
}

#Preview {
    StartPage()
}
