//
//  MainGameplay.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 23/05/24.
//

import SwiftUI

struct MainGameplay: View {
    @State var countdownDone:Bool = false
    var body: some View {
        if countdownDone {
            GameplayView()
        } else {
            Countdown()
            .onAppear{
                Task {
                    try? await Task.sleep(for: .seconds(3))
                    countdownDone = true
                }
            }
        }

    }
}

#Preview {
    MainGameplay()
}
