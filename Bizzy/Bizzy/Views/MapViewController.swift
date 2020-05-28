//
//  MapViewController.swift
//  Bizzy
//
//  Created by Henry Warren on 5/22/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI

struct MapViewController: View {
    var body: some View {
        ZStack{
        MapView()
            .edgesIgnoringSafeArea(.all)
            MenuButton()
        }
    }
}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        MapViewController().environmentObject(ViewRouter())
    }
}
