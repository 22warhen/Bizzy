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
class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    var location:CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.startUpdatingLocation()
    }
    var newLocation: ((EndResult<CLLocation>) -> Void)?
    var didChangeStatus: ((Bool) -> Void)?
    var status: CLAuthorizationStatus{
        return CLLocationManager.authorizationStatus()
    }
    func getLocation() {
        self.locationManager.requestLocation()
    }
    
    func requestLocationAuthorization() {
        print("doing stuff")
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
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
            didChangeStatus?(false)
        default:
            didChangeStatus?(true)
        }
    }
}
