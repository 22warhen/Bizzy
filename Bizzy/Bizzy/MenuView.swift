//
//  MenuView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/16/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//
import SwiftUI
let storesPage = MenuRow(menuRowActive: true,icon: "house",text: "Stores", x: "storesPage")
let mapPage = MenuRow(menuRowActive: false,icon: "map",text: "Map",x: "mapPage")
let logInPage = MenuRow(menuRowActive:
               false,icon:"arrow.uturn.left",text:"Log Out",x: "logInPage")
struct Menu: View {
    @Binding var open: Bool
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "gear")
                    .font(.system(size:30,weight:.heavy))
                    .foregroundColor(.white)
                .frame(width: 25, height: 100)
    
                
            }
                Text(accountName)
                              .foregroundColor(.white)
                                  .font(.system(size:24,weight:.bold))
                    .frame(height:15)
                    .offset(x: 0,y:-40)
    
            .padding(.top,20)
            storesPage
            mapPage
            Spacer()
            if loggedIn == true{
                logInPage
            }
        }
        .padding(.vertical,40)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.systemGray3),Color.blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom))
        //.background(Color(.systemGray2))
        .padding(.trailing,80)
            .offset(x: open ? 0 : -UIScreen.main.bounds.width)
        .edgesIgnoringSafeArea(.vertical)
            .animation(.default)
            .onTapGesture {
                self.open.toggle()
        }
    }
}




struct MenuRow: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var menuRowActive = true
    @State var icon: String
    @State var text: String
    @State var x: String
    func menuNavigate(location: String) {
         print("doing shit")
    if location == "storesPage" {
    viewRouter.currentPage = "page1"
    self.menuRowActive = true
    mapPage.menuRowActive = false
    logInPage.menuRowActive = false
    print("done did shit 1")
    }
    else if location == "mapPage"{
        viewRouter.currentPage = "page2"
        storesPage.menuRowActive = false
        self.menuRowActive = true
        logInPage.menuRowActive = false
        print("done did shit 2")
    }
    else if location == "logInPage"{
        print("going to login page when it exists")
        storesPage.menuRowActive = false
        mapPage.menuRowActive = false
        self.menuRowActive = true
        print("done did shit 3")
        }
        else{print("that ain't it chief")}
    }
    var body: some View {
        Button(action : {
            self.menuNavigate(location: self.x)
            print("should be doing shit")})
 {
             HStack{
                Image(systemName: icon)
                    .foregroundColor(menuRowActive ? Color(.purple): .white)
                    .font(.system(size: 15,weight:menuRowActive ? .bold : .regular))
                .frame(width: 48, height: 40)
                
                Text(text)
                    .foregroundColor(menuRowActive ? Color(.purple): .white)
                .font(.system(size: 15,weight:menuRowActive ? .bold : .regular))
                
                Spacer()
            }
        .padding(4)
        .background(menuRowActive ? Color(.white): Color.white.opacity(0))
        .padding(.trailing,20)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .offset(x:20)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        Menu(open: .constant(true))

    }
}

