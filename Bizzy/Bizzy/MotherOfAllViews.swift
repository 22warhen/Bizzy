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
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "page1" {
        didSet {
            objectWillChange.send(self)
        }
    }
}


 struct MotherView : View {
    func menuNavigate(location: String) {
        if location == "storesPage" {
    viewRouter.currentPage = "page1"
    storesPage.menuRowActive = true
    mapPage.menuRowActive = false
    logInPage.menuRowActive = false
    }
    else if location == "mapPage"{
        viewRouter.currentPage = "page2"
        storesPage.menuRowActive = false
        mapPage.menuRowActive = true
        logInPage.menuRowActive = false
    }
    else if location == "logInPage"{
        print("going to login page when it exists")
        storesPage.menuRowActive = false
        mapPage.menuRowActive = false
        logInPage.menuRowActive = true
        }
        else{print("that ain't it chief")}
    }
    @State var open = false
    @State var page = "page1"
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading){
            HStack(alignment: .top) {
                        Button(action: {self.open.toggle()
                            self.menuNavigate(location: "mapPage")
                        }){
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                                .foregroundColor(.black)

                        }
                        .offset(y:15)
                }

                .padding()
                Spacer()
            }
        
        VStack {
            if viewRouter.currentPage == "page1" {
                ContentView()
            } else if viewRouter.currentPage == "page2" {
                MapView()
            }
        }
            Menu(open: $open)
    }
    }
    
}


struct MotherView_Previews : PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}

