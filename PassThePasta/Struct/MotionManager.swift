//
//  MotionManager.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 20/05/24.
//

import Foundation
import CoreMotion
import SwiftUI

class MotionManager: ObservableObject {
    private var motionManager: CMMotionManager
    @Published var pastaOffset: CGPoint = .zero
    @Published var meatballOffset1: CGPoint = .zero
    @Published var meatballOffset2: CGPoint = .zero
    @Published var meatballOffset3: CGPoint = .zero
    @Published var meatballOffset4: CGPoint = .zero
    @Published var breadOffset: CGPoint = .zero
    @Published var cheeseOffset: CGPoint = .zero
    
    @Published var pastaVisibility: Bool = true
    @Published var meatballVisibility1: Bool = true
    @Published var meatballVisibility2: Bool = true
    @Published var meatballVisibility3: Bool = true
    @Published var meatballVisibility4: Bool = true
    @Published var breadVisibility: Bool = true
    @Published var cheeseVisibility: Bool = true

    init() {
        self.motionManager = CMMotionManager()
        startAccelerometerUpdates()
    }

    private func startAccelerometerUpdates() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 1.0 / 30.0  // 30 Hz
            
            motionManager.startAccelerometerUpdates(to: .main) { [weak self] (data, error) in
                guard let self = self, let data = data else { return }
                
                withAnimation(Animation.spring(duration: 0.5)) {
                    self.updateOffset(data.acceleration, for: &self.pastaOffset, visibility: &self.pastaVisibility, multiplier: 100/2, bound: 400/2)
                    self.updateOffset(data.acceleration, for: &self.meatballOffset1, visibility: &self.meatballVisibility1, multiplier: 200/2, bound: 800/2)
                    self.updateOffset(data.acceleration, for: &self.meatballOffset2, visibility: &self.meatballVisibility2, multiplier: 240/2, bound: 960/2)
                    self.updateOffset(data.acceleration, for: &self.meatballOffset3, visibility: &self.meatballVisibility3, multiplier: 160/2, bound: 640/2)
                    self.updateOffset(data.acceleration, for: &self.meatballOffset4, visibility: &self.meatballVisibility4, multiplier: 220/2, bound: 880/2)
                    self.updateOffset(data.acceleration, for: &self.breadOffset, visibility: &self.breadVisibility, multiplier: 70, bound: 280)
                    self.updateOffset(data.acceleration, for: &self.cheeseOffset, visibility: &self.cheeseVisibility, multiplier: 60, bound: 240)
                }
            }
        }
    }

    private func updateOffset(_ acceleration: CMAcceleration, for offset: inout CGPoint, visibility: inout Bool, multiplier: Double, bound: Double) {
        if abs(offset.y) < bound {
            offset.y += CGFloat(acceleration.x * multiplier)
        } else {
            visibility = false
        }
        if abs(offset.x) < bound {
            offset.x += CGFloat(acceleration.y * multiplier)
        } else {
            visibility = false
        }
    }
    
    

    deinit {
        motionManager.stopAccelerometerUpdates()
    }
}
