//
//  MotherOfAllViews.swift
//  abseil
//
//  Created by Henry Warren on 5/20/20.
//
import Foundation
import Combine
import SwiftUI
import CoreLocation
import SwiftLocation
class ViewRouter: ObservableObject {
    var animationType : Animation = .spring()
    {
    didSet {
        objectWillChange.send(self)
        }
    }
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "page0" {
        didSet {
            withAnimation(animationType) {
            objectWillChange.send(self)
            }
        }
    }
}

 struct MotherView : View {
    let once = Once()
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var yelpManager = YelpManager()
    @EnvironmentObject var spark : Spark
    @State var page = "page1"
    @State var avail = false
    @State var x = 0
    func oneSetter() {
        self.viewRouter.currentPage = "page0"
        self.viewRouter.currentPage = "page1"
    }

    let locationService = LocationServices()
    
    var body: some View {
        let authCheck = LocationManager.shared.onAuthorizationChange.add { newState in
            if newState == .available{
                self.avail = true
            }}
        once.run{
//            if locationService.status != .notDetermined && self.avail == true && locationService.status != .denied && locationService.status != .restricted &&
            if locationService.status == .authorizedAlways
            {
            print("authorizedAlways enabled, heading to 'page1')")
                once.run {
                    yelpManager.loadBusinesses()}
            oneSetter()
            }}
            
        return ZStack{
//                if self.spark.isUserAuthenticated == .undefined {
//                    LaunchScreenView()
//                }
//                else if self.spark.isUserAuthenticated == .signedOut{
//                    SignInView()
//                }
//                else if self.spark.isUserAuthenticated == .signedIn {
//                    ContentView()
//                }i

            if self.viewRouter.currentPage == "howBusy"{
                HowBusy()
            }
            if self.viewRouter.currentPage == "page0.1" {
                LocDenied()
            }
                if self.viewRouter.currentPage == "page0"{
                    WeNeedIt(locationService: LocationServices())
                               }
                else if self.viewRouter.currentPage == "page1" {
                    ContentView(yelpManager: YelpManager())
                } else if self.viewRouter.currentPage == "page2" {
                    MapViewController()
                }
                else if self.viewRouter.currentPage == "page3" {
                    signInView()
                }
                }
                
            }
}
    


struct MotherView_Previews : PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}

