//
//  LocationManager.swift
//  Bizzy
//
//  Created by Henry Warren on 5/26/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import Foundation
import MapKit
enum EndResult<T> {
    case success(T)
    case failure(Error)
}
class LocationServices: NSObject {
    private let locationManager = CLLocationManager()
    var location:CLLocation? = nil
    var noLoco = false
    override init() {
        super.init()
        self.locationManager.delegate = self
        //self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //self.locationManager.distanceFilter = kCLDistanceFilterNone
        //self.locationManager.startUpdatingLocation()
    }
    var newLocation: ((EndResult<CLLocation>) -> Void)?
    var whenInUse: ((Bool) -> Void)?
    var alwaysInUse: ((Bool) -> Void)?
    var status: CLAuthorizationStatus{
        return CLLocationManager.authorizationStatus()
    }
    func getLocation() {
        self.locationManager.requestLocation()
    }
    
    func requestLocationAuthorization() {
        self.locationManager.requestAlwaysAuthorization()
    }
}

extension LocationServices: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        newLocation?(.failure(error))
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location =  locations.sorted(by: {$0.timestamp > $1.timestamp}).first {
            newLocation?(.success(location))}
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined,.restricted, .denied:
            whenInUse?(false)
            alwaysInUse?(false)
//        default:
//            didChangeStatus?(true)
        case .authorizedAlways:
            alwaysInUse?(true)
        case .authorizedWhenInUse:
            whenInUse?(true)
        @unknown default:
            assertionFailure()
        }
    }
}

//run locationService once
class Once {

  var already: Bool = false

  func run(block: () -> Void) {
    guard !already else { return }

    block()
    already = true
  }
}
