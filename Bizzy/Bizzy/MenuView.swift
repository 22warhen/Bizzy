//
//  MenuView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/16/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI

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
            
            MenuRow(menuRowActive: false,icon: "house",text: "Stores")
            MenuRow(menuRowActive: false,icon: "map",text: "Map")
            Spacer()
            
            if loggedIn == true{
            MenuRow(menuRowActive:
                false,icon:"arrow.uturn.left",text:"Log Out")
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
    @State var menuRowActive = false
    var icon = "house"
    var text = "Dashboard"
    @State var Stores = false
    @State var Map = false
    @State var LogOut = false
    var body: some View {
        
        Button(action:
            {
                if self.text == "Stores"{
                    print("enabled stores")
                    self.Stores = true
                    
                    self.menuRowActive = true
                    self.Map = false
                    self.LogOut = false
                }
                if self.text == "Map"{
                    print("enabled map")
                self.menuRowActive = true
                    self.Map = true
                    self.Stores = false
                    self.LogOut = false
                }
                if self.text == "Log Out"{
                    print("enabled log out")
                    self.LogOut = true
                    self.menuRowActive = true
                    self.Stores = false
                    self.LogOut = false
                    }
            
        }) {
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
