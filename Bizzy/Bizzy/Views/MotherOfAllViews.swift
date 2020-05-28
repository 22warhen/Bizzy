//
//  MotherOfAllViews.swift
//  abseil
//
//  Created by Henry Warren on 5/20/20.
//
import Foundation
import Combine
import SwiftUI
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
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var spark : Spark
    private func noLoco() {
    switch locationService.status {
    case .notDetermined,.denied,.restricted:
        self.viewRouter.currentPage = "page0"
    default:
        assertionFailure()
        }
    }
    @State var page = "page1"
    let locationService = LocationManager()
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
//                if self.spark.isUserAuthenticated == .undefined {
//                    LaunchScreenView()
//                }
//                else if self.spark.isUserAuthenticated == .signedOut{
//                    SignInView()
//                }
//                else if self.spark.isUserAuthenticated == .signedIn {
//                    ContentView()
//                }
                
                if self.viewRouter.currentPage == "page0" {
                    WeNeedIt(locationService: LocationManager())
                               }
                else if self.viewRouter.currentPage == "page1" {
                        ContentView()
                } else if self.viewRouter.currentPage == "page2" {
                    MapViewController()
                }
                else if self.viewRouter.currentPage == "page3" {
                    signInView()
                }
                }
                
            }
            }
        
    }
    


struct MotherView_Previews : PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}

