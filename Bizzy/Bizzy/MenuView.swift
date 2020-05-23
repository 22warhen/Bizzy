//
//  MenuView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/16/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//
import SwiftUI
let storesPage = MenuRow(menuRowActive:Bool(),icon: "house",text: "Stores", x: "page1")
let mapPage = MenuRow(menuRowActive: Bool(),icon: "map",text: "Map",x: "page2")
let logInPage = MenuRow(menuRowActive:
    Bool(),icon:"arrow.uturn.left",text:"Log Out",x: "page3")
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
    @State var menuRowActive : Bool
    @State var icon: String
    @State var text: String
    @State var x: String
    
    func menuNavigate(location: String) {
    if self.viewRouter.currentPage == x {
    self.menuRowActive = true
        print(self.x,"highlighted",self.menuRowActive)
    }
    else{self.menuRowActive = false
        print(self.x,"highlighted",self.menuRowActive)
        }
    }
    var body: some View {
         if true{menuNavigate(location: x)}
         return Button(action : {
            self.viewRouter.currentPage = self.x
            self.menuNavigate(location: self.x)})
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
              .onAppear {if self.viewRouter.currentPage == self.x {
                  self.menuRowActive = true
                  print("done did stuff 1")
                  }
                  else{self.menuRowActive = false}
                  }}
        }
    }


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        Menu(open: .constant(true))

    }
}

