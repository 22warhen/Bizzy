//
//  MapCoordinator.swift
//  Bizzy
//
//  Created by Henry Warren on 5/18/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView
    
    init(_ control: MapView){
        self.control = control
    }
    
    
    
}
