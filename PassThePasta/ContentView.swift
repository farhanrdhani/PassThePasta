//
//  ContentView.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 17/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
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
            
            HStack {
                Image("LOGO_PASSTHEPASTA")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height*2/3)
                    .padding()
                
                Image("BUTTON_START_PASSTHEPASTA")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height/6)
                    .padding()
                
            }
            

                
        }
        .ignoresSafeArea()
        
    }
    
            
}

#Preview {
    ContentView()
}
