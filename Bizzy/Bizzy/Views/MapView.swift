//
//  MapView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/18/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation
struct MapView: UIViewRepresentable {
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView){
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
        
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let annotation = MKPointAnnotation()
        annotation.title = "Columbus"
        annotation.subtitle = "Capital of Ohio"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 39.983334, longitude: -82.983330)
        mapView.addAnnotation(annotation)
        return mapView
    }
    

    func updateUIView(_ view: MKMapView, context: Context){
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
