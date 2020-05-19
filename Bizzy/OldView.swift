//
//  ContentView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/15/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI
struct OldView: View {
    
    @State var showMenu = false
    
    var body: some View {
        let dragBack = DragGesture()
            .onEnded{
                if $0.translation.width < -100 {
                    withAnimation {
                            self.showMenu = false
                        }
                }
        }
        
        return NavigationView {
            GeometryReader {geometry in ZStack(alignment: .leading) {
                MainView(showMenu: self.$showMenu)
                .frame(width: geometry.size.width, height:geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width/2:0)
                    .disabled(self.showMenu ? true: false)
                if self.showMenu {
                    HamburglerView()
                        .frame(width: geometry.size.width/2)
                        .transition(.move(edge: .leading))
                }
                }
            .gesture(dragBack)
                
            }
            }
               
        

    }
}
struct MainView: View {
    @Binding var showMenu: Bool
    var body: some View {
        VStack {
            ZStack (){
                HStack{
                        Button(action:{
                            withAnimation{
                                self.showMenu = true
                                        
                                    }
                                })
                                {
                                    Image(systemName:"line.horizontal.3")
                                        .imageScale(.large)
                                        .foregroundColor(.black)
                                        .frame(width:25,height:25)
                        }
                }
                
                
            }
            .padding()
            Spacer()
        }
        

    
        
    }
}
struct OldView_Previews: PreviewProvider {
    static var previews: some View {
        OldView()
    }
}

