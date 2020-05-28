//
//  MenuView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/16/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//
import SwiftUI
//let mapPage = MenuRow(menuRowActive: Bool(),icon: "map",text: "Map",x: "page2")
//let logInPage = MenuRow(menuRowActive:
    //Bool(),icon:"arrow.uturn.left",text:"Log Out",x: "page3")
struct Menu: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @Binding var open : Bool
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
            if viewRouter.currentPage == "page1"{
                MenuRow(menuRowActive:true,menuRowActive2: false, menuRowActive3: false,icon: "house",text: "Stores",icon2: "map",text2: "Map",icon3: "arrow.uturn.left",text3: "Log 1")}
            else if viewRouter.currentPage == "page2"{
            MenuRow(menuRowActive:false,menuRowActive2: true, menuRowActive3: false,icon: "house",text: "Stores",icon2: "map",text2: "Map",icon3: "arrow.uturn.left",text3: "Log 2")}
            else if viewRouter.currentPage == "page3"{
            MenuRow(menuRowActive:false,menuRowActive2: false, menuRowActive3: true,icon: "house",text: "Stores",icon2: "map",text2: "Map",icon3: "arrow.uturn.left",text3: "Log 3")
            }
            //mapPage
            Spacer()
           // if loggedIn == true{
                //logInPage
            //}
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
    @State var menuRowActive : Bool
    @State var menuRowActive2 : Bool
    @State var menuRowActive3 : Bool
    @State var icon: String
    @State var text: String
    @State var icon2: String
    @State var text2: String
    @State var icon3: String
    @State var text3: String
    var body: some View {
            VStack{
                Button(action: {self.viewRouter.currentPage = "page1"                }) {
              HStack{
                Image(systemName: icon)
                    .foregroundColor(menuRowActive ? Color(.purple): .white)
                    .font(.system(size: 15,weight:menuRowActive ? .bold : .regular))
                .frame(width: 48, height: 40)
                
                Text(text)
                    .foregroundColor(menuRowActive ? Color(.purple): .white)
                .font(.system(size: 15,weight:menuRowActive ? .bold : .regular))
                
                Spacer()
              } .padding(4)
                .background(menuRowActive ? Color(.white): Color.white.opacity(0))
                .padding(.trailing,20)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .offset(x:20)
                }
                
                
                
                
                Button(action: {self.viewRouter.currentPage = "page2"
                }) {
                HStack{
                  Image(systemName: icon2)
                      .foregroundColor(menuRowActive2 ? Color(.purple): .white)
                      .font(.system(size: 15,weight:menuRowActive ? .bold : .regular))
                  .frame(width: 48, height: 40)
                  
                  Text(text2)
                      .foregroundColor(menuRowActive2 ? Color(.purple): .white)
                  .font(.system(size: 15,weight:menuRowActive2 ? .bold : .regular))
                  
                  Spacer()
                } .padding(4)
                  .background(menuRowActive2 ? Color(.white): Color.white.opacity(0))
                  .padding(.trailing,20)
                  .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                  .offset(x:20)
                    }
                
                
                
                Spacer()
                if loggedIn == true{
                Button(action: {self.viewRouter.currentPage = "page3"
                    
                }) {
                HStack{
                  Image(systemName: icon3)
                      .foregroundColor(menuRowActive3 ? Color(.purple): .white)
                      .font(.system(size: 15,weight:menuRowActive3 ? .bold : .regular))
                  .frame(width: 48, height: 40)
                  
                  Text(text3)
                      .foregroundColor(menuRowActive3 ? Color(.purple): .white)
                  .font(.system(size: 15,weight:menuRowActive3 ? .bold : .regular))
                  
                  Spacer()
                } .padding(4)
                  .background(menuRowActive3 ? Color(.white): Color.white.opacity(0))
                  .padding(.trailing,20)
                  .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                  .offset(x:20)
                    }}
                
            }
                
            }

        }


