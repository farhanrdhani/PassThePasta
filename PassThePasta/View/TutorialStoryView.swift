//
//  TutorialStoryView.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 17/05/24.
//

import SwiftUI

struct TutorialStoryView: View {
    var screenHeight = UIScreen.main.bounds.height
    var body: some View {
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
                        
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        Image("CHEFSPAT_PTP")
                            .resizable()
                            .scaledToFit()
                        .frame(height: screenHeight/2)
                    }
                    
                }
                
                VStack(alignment: .leading) {
                    Text("PATS")
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                .padding(36)
                .background(.white)
                .cornerRadius(24)
                .offset(CGSize(width: 0, height: -50))
                .padding(.bottom, -50)
                
            }
            .padding(32)
            
 
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TutorialStoryView()
}
