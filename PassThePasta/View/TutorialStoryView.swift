//
//  TutorialStoryView.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 17/05/24.
//

import SwiftUI

struct TutorialStoryView: View {
    var screenHeight = UIScreen.main.bounds.height
    
    var convolists:[IntroConversation] = [
        IntroConversation(name: "PATS", text: "Hello, Chef!"),
        IntroConversation(name: "CHEF SPAT", text: "Hey Kiddo, what's up?"),
        IntroConversation(name: "PATS", text: "Not much, but I read there's a job opening for a waiter in front of your restaurant."),
        IntroConversation(name: "CHEF SPAT", text: "Do you want to apply??? This place isn't for lazing around."),
        IntroConversation(name: "PATS", text: "I happen to need some money, Chef. Heheheh..."),
        IntroConversation(name: "CHEF SPAT", text: "Working here requires agility and balance..."),
        IntroConversation(name: "CHEF SPAT", text: "ARE YOU UP FOR IT???"),
        IntroConversation(name: "PATS", text: "YES, CHEF!!!"),
        IntroConversation(name: "CHEF SPAT", text: "I don't see from your looks that you are really ready."),
        IntroConversation(name: "PATS", text: "Please, Chef, allow me to work."),
        IntroConversation(name: "CHEF SPAT", text: "HMM..."),
        IntroConversation(name: "CHEF SPAT", text: "Okayyy, I will test your abilities today. If you can pass, you can work here."),
        IntroConversation(name: "PATS", text: "YES, CHEF!!!"),
        IntroConversation(name: "CHEF SPAT", text: "Let me explain the job for you...")
    ]
    
    
    @State var convolistsActive = 0
    @State var  isShowGameplayView: Bool = false
    
    var body: some View {
        Group {
            ZStack{
                LinearGradient(
                    gradient: Gradient(colors: [.tealBackground, .blueBackground]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                
                Image("MAINBACK_PTP")
                    .resizable()
                
                VStack {
                    Spacer()
                    //                Image("Tutorial_Chat_Pats_PTP")
                    //                    .resizable()
                    //                    .scaledToFit()
                    //                .frame(height: screenHeight*2/3)
                    
                    HStack{
                        
                        VStack {
                            Spacer()
                            Image("PATS_PTP")
                                .resizable()
                                .scaledToFit()
                                .frame(height: screenHeight*2/5)
                                .brightness(convolists[convolistsActive].name == "PATS" ? 0 : -0.5)
                                .grayscale(convolists[convolistsActive].name == "PATS" ? 0 : 0.5)
                        }
                        Spacer()
                        VStack {
                            Spacer()
                            Image("CHEFSPAT_PTP")
                                .resizable()
                                .scaledToFit()
                                .frame(height: screenHeight/2)
                                .brightness(convolists[convolistsActive].name == "CHEF SPAT" ? 0 : -0.5)
                                .grayscale(convolists[convolistsActive].name == "CHEF SPAT" ? 0 : 0.5)
                        }
                        
                    }
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Text(convolists[convolistsActive].name)
                                .font(.custom("ARCO", size: 40))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color("YellowTextColor"))
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        Spacer()
                        
                        if convolistsActive == 0 {
                            TypingTextView(fullText: convolists[0].text)
                        } else if convolistsActive == 1 {
                            TypingTextView(fullText: convolists[1].text)
                        } else if convolistsActive == 2 {
                            TypingTextView(fullText: convolists[2].text)
                        } else if convolistsActive == 3 {
                            TypingTextView(fullText: convolists[3].text)
                        } else if convolistsActive == 4 {
                            TypingTextView(fullText: convolists[4].text)
                        } else if convolistsActive == 5 {
                            TypingTextView(fullText: convolists[5].text)
                        } else if convolistsActive == 6 {
                            TypingTextView(fullText: convolists[6].text)
                        } else if convolistsActive == 7 {
                            TypingTextView(fullText: convolists[7].text)
                        } else if convolistsActive == 8 {
                            TypingTextView(fullText: convolists[8].text)
                        } else if convolistsActive == 9 {
                            TypingTextView(fullText: convolists[9].text)
                        } else if convolistsActive == 10 {
                            TypingTextView(fullText: convolists[10].text)
                        } else if convolistsActive == 11 {
                            TypingTextView(fullText: convolists[11].text)
                        } else if convolistsActive == 12 {
                            TypingTextView(fullText: convolists[12].text)
                        } else if convolistsActive == 13 {
                            TypingTextView(fullText: convolists[13].text)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            Text(convolistsActive == convolists.count - 1 ? "tap to START" : "Tap to continue...")
                                .font(.custom("comfortaa-bold", size:20))
                                .foregroundColor(Color("BlueTextColor"))
                        }
                    }
                    .padding(.trailing)
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .padding(36)
                    .background(.white)
                    .cornerRadius(24)
                    .offset(CGSize(width: 0, height: -50))
                    .padding(.bottom, -50)
                    .onTapGesture {
                        if convolistsActive < convolists.count - 1 {
                            withAnimation(Animation.spring(duration: 1)) {
                                convolistsActive += 1
                                playSoundForCurrentConversation()
                            }
                        }
                        
                        print(convolistsActive)
                        if convolistsActive == 13 {
                            isShowGameplayView = true
                            print(isShowGameplayView)
                        }
                        
                    }
                    
                }
                .padding(32)
                .onAppear {
                    print(convolistsActive)
                }
                
                
                
            }
            .navigationDestination(isPresented: $isShowGameplayView, destination: {
                TutorialView()
                    .ignoresSafeArea()
            })
            .onChange(of: convolistsActive) {
                print("Test\(convolistsActive)")
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .onAppear {
                MusicManager.shared.playTutorialMusic()
            }
            .onDisappear {
                MusicManager.shared.stopTutorialMusic()
            }
        }
    }
    
    func playSoundForCurrentConversation() {
            let currentConversation = convolists[convolistsActive]
            let soundName: String
            
            switch currentConversation.name {
            case "PATS":
                soundName = "patsSound"
            case "CHEF SPAT":
                soundName = "chefSpatSound"
            default:
                soundName = "default_sound" // Use a default sound if needed
            }
            
            SoundManager.shared.playSound(named: soundName)
        }
}



#Preview {
    TutorialStoryView()
}
