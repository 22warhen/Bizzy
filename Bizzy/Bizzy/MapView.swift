//
//  MapView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/18/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI
import MapKit
struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> (Coordinator) {
        Coordinator(self)
    }
    func updateUIView(_ uiView: MKMapView, context:
        UIViewRepresentableContext<MapView>){
            
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
