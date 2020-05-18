//
//  NewView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/16/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI
struct ContentView: View {
@State var open = false
    var body: some View {
        ZStack(alignment: .topLeading){
        HStack(alignment: .top) {
                    Button(action: {self.open.toggle()}){
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.black)

                    }
                    .offset(y:15)
            }

            .padding()
            Spacer()
            Menu(open: $open)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //Menu(open: .constant(true))
    }
}

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
            
            MenuRow(menuRowActive: true,icon: "house",text: "Stores")
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
    var menuRowActive: Bool
    var icon = "house"
    var text = "Dashboard"
    
    var body: some View {
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
