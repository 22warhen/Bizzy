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
    @State var open = false
    @State var page = "page1"
    var body: some View {
        Group {
            ZStack {
                ZStack(alignment: .topLeading){
                HStack(alignment: .top) {
                            Button(action: {self.open.toggle()
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
                else if viewRouter.currentPage == "page3" {
                    signInView()
                }
            }
                Menu(open: $open)
            }
        }
    }
    
}


struct MotherView_Previews : PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}

