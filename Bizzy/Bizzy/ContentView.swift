//
//  NewView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/16/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    @State var open = true
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    Spacer()
                    Button(action: {self.open.toggle()}){
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                }
                Spacer()
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        Menu(open: .constant(true))
    }
}

struct Menu: View {
    @Binding var open: Bool
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "gear")
                    .foregroundColor(.white)
                        .font(.system(size: 24, weight: .heavy))
                .frame(width: 32, height: 32)
            }
            .padding(.top,20)
            HStack{
                Spacer()
            }
            
            Spacer()
            
        }
        .padding(.vertical,30)
        .background(LinearGradient(gradient: Gradient(colors: [Color("Blue"), Color("Purple")]), startPoint: .top, endPoint: .bottom))
        .padding(.trailing,80)
        .edgesIgnoringSafeArea(.vertical)
    }
    
}
