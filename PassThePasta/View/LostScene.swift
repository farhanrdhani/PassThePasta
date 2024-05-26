//
//  LostScene.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 22/05/24.
//

import SwiftUI

struct LostScene: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.tealBackground, .blueBackground]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                Image("LOST_SCENE_PNG")
                    .resizable()
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    HStack {
                        NavigationLink(destination: MainGameplay()) {
                            Text("Play Again")
                                .font(.custom("ARCO", size: 40))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color("YellowTextColor"))
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .padding(36)
                                .background(Color.white)
                                .cornerRadius(24)
                        }

                        Spacer()

                        NavigationLink(destination: StartPage()) {
                            Text("Back to START")
                                .font(.custom("ARCO", size: 40))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color("YellowTextColor"))
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .padding(36)
                                .background(Color("BlueTextColor"))
                                .cornerRadius(24)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    LostScene()
}
