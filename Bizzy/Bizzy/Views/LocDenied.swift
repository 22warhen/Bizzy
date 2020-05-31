//
//  LocDenied.swift
//  Bizzy
//
//  Created by Henry Warren on 5/29/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI
import SwiftLocation
struct LocDenied: View {
    init() {
        LocationManager.shared.requireUserAuthorization(.always)
    }
    @State var locationService = LocationServices()
    @EnvironmentObject var viewRouter : ViewRouter
    var body: some View {
        let observerID = LocationManager.shared.onAuthorizationChange.add { newState in
            if newState == .available && (self.locationService.status == .authorizedAlways){
                self.viewRouter.currentPage = "page1"
                // Remove all observers
                LocationManager.shared.onAuthorizationChange.removeAll()
            }
        }
        return ZStack {
            
            ZStack{
                Color(UIColor.systemGray)
            }.edgesIgnoringSafeArea(.all)
        VStack (alignment: .leading){
            Text("You denied access to location. To fix this:")
            Text("1.    Go to Settings -> Privacy -> Location Services -> Bizzy and enable \"Always\"").padding(.vertical)
            Text("2.    Re-enter Bizzy. That's it!")
        }.padding()
    }
    }
}

struct LocDenied_Previews: PreviewProvider {
    static var previews: some View {
        LocDenied()
    }
}
