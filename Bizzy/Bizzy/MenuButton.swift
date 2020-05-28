//
//  MenuButton.swift
//  Bizzy
//
//  Created by Henry Warren on 5/22/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//
import SwiftUI
struct MenuButton: View {
   @State var open = false
    var body: some View {GeometryReader{ geometry in
        ZStack{
        HStack{
            VStack(alignment: .leading){
        Button(action:{
            self.open = true}){
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(Color("bowob"))
                        .frame(width: 50, height: 50)
                
                }
                       Spacer()
        }
    
        .padding(.horizontal)
        Spacer()
        }
            Menu(open: self.$open).frame(width: geometry.size.width,height: geometry.size.height)
            }
        }
    }
}


struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton().environmentObject(ViewRouter())
    }
}
