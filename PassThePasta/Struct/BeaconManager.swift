//
//  BeaconManager.swift
//  PassThePasta
//
//  Created by Farhan Rizqy Ramadhani on 20/05/24.
//

import Foundation
import CoreLocation
import Combine

class BeaconManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    let locationManager = CLLocationManager()
    let uuidString = "8C94587E-11C9-4D0E-867E-970A0195AD70"
    var constraint: CLBeaconIdentityConstraint!
    
    @Published var proximity: CLProximity = .unknown
    
    override init() {
        super.init()
        
        if let uuid = UUID(uuidString: uuidString) {
            constraint = CLBeaconIdentityConstraint(uuid: uuid)
            let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "kCBAdvDataAppleBeaconKey")
            
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            locationManager.startMonitoring(for: beaconRegion)
            locationManager.startRangingBeacons(satisfying: beaconRegion.beaconIdentityConstraint)
        } else {
            print("Invalid UUID string")
            // Handle the case when UUID string is invalid
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region is CLBeaconRegion {
            print("Entered beacon region!")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region is CLBeaconRegion {
            print("Exited beacon region!")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon = beacons.first {
            self.proximity = beacon.proximity
        }
    }
}
