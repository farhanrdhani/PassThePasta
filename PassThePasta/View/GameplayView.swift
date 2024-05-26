//
//  GameplayView.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 17/05/24.
//

import SwiftUI

struct GameplayView: View {
    var beaconManager = BeaconManager()
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var motionManager = MotionManager()
    @State private var navigateToWinPage = false
    @State private var navigateToLostPage = false
    
    var screenHeight = UIScreen.main.bounds.height
    var body: some View {
        
        Group {
            ZStack {
                NavigationLink(
                    destination: WinScene(),
                    isActive: $navigateToWinPage
                ) {
                    EmptyView()
                }
                
                NavigationLink(
                    destination: LostScene(),
                    isActive: $navigateToLostPage
                ) {
                    EmptyView()
                }
                
                LinearGradient(
                    gradient: Gradient(colors: [.tealBackground, .blueBackground]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                
                Image("BACK2_PTP")
                    .resizable()
                    .opacity(0.25)
                
                Image("MAINBACK_PTP")
                    .resizable()
                    .opacity(0.25)
                
                Image("BAKI_PTP")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenHeight*7/8)
                    .padding()
                
                HStack {
                    ZStack {
                        if motionManager.pastaVisibility {
                            Image("PASTA_PTP")
                                .resizable()
                                .scaledToFit()
                                .frame(height: screenHeight*2/3)
                                .offset(x: motionManager.pastaOffset.x, y: motionManager.pastaOffset.y)
                        }
                        
                        VStack {
                            HStack{
                                if motionManager.meatballVisibility1 {
                                    Image("MEATBALL_PTP")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenHeight*1/5)
                                        .offset(x: motionManager.meatballOffset1.x, y: motionManager.meatballOffset1.y)
                                    
                                    if motionManager.meatballVisibility2 {
                                        Image("MEATBALL_PTP")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: screenHeight*1/6)
                                            .offset(x: motionManager.meatballOffset2.x, y: motionManager.meatballOffset2.y)
                                    }
                                }
                            }
                            
                            HStack{
                                if motionManager.meatballVisibility3 {
                                    Image("MEATBALL_PTP")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenHeight*1/8)
                                        .offset(x: motionManager.meatballOffset3.x, y: motionManager.meatballOffset3.y)
                                    
                                    if motionManager.meatballVisibility4 {
                                        Image("MEATBALL_PTP")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: screenHeight*1/6)
                                            .offset(x: motionManager.meatballOffset4.x, y: motionManager.meatballOffset4.y)
                                    }
                                }
                            }
                        }
                    }
//                    VStack{
//                        
//                        if motionManager.breadVisibility {
//                            Image("BREAD_PTP")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: screenHeight*1/3)
//                                .offset(x: motionManager.breadOffset.x, y: motionManager.breadOffset.y)
//                        }
//                        
//                        if motionManager.cheeseVisibility {
//                            Image("CHEESE_PTP")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: screenHeight*1/4)
//                                .offset(x: motionManager.cheeseOffset.x, y: motionManager.cheeseOffset.y)
//                        }
//                        
//                    }

                }
                
                
            }
            .onAppear {
                _ = motionManager
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .onReceive(beaconManager.$proximity) { proximity in
                if !motionManager.pastaVisibility {
                    navigateToLostPage = true
                    print("kalah")
                    
                } else {
                    switch proximity {
                    case .immediate:
                        navigateToWinPage = true
                        print("immediate")
                    case .near:
                        print("near")
                    case .far:
                        print("far")
                    case .unknown:
                        print("...")
                    @unknown default:
                        print("error") // Handle any future unknown cases
                    }
                }
            }
        }
    }
}

#Preview {
    GameplayView()
}
