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
class Highlighter: ObservableObject {

    @Published var highlight: Bool = true

    func changeField() {
        highlight = false
    }
}

 struct MotherView : View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var page = "page1"
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                if self.viewRouter.currentPage == "page1" {
                    MenuButton.init(open: false)
                    ContentView()
                } else if self.viewRouter.currentPage == "page2" {
                    MenuButton.init(open: false)
                    MapViewController()
                }
                else if self.viewRouter.currentPage == "page3" {
                    MenuButton.init(open: false)
                    signInView()
                }
                
            }
            
            }
        .overlay(MenuButton())
                }
    }
    


struct MotherView_Previews : PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}

