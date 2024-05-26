//
//  TutorialView.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 22/05/24.
//

import SwiftUI

struct TutorialView: View {
    
    @State private var navigateToMainGameplay = false
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [.tealBackground, .blueBackground]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            Image("TUTOR_PNG")
                .resizable()
                .onTapGesture {
                    navigateToMainGameplay = true
                }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        
        NavigationLink(destination: MainGameplay(), isActive: $navigateToMainGameplay) {
                            EmptyView()
                        }
    }
    
    
    
    
}

#Preview {
    TutorialView()
}
