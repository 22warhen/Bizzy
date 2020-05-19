//
//  HamburglerView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/16/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI

struct HamburglerView: View {
    var body: some View {
        VStack(alignment: .leading)
        { HStack{
            Image(systemName: "chart.bar")
            .foregroundColor(.gray)
            .imageScale(.large)
            Text("Stores")
                .foregroundColor(.gray)
                .font(.headline)
        }
        .padding(.top,100)
            HStack{
                Image(systemName: "map")
                .foregroundColor(.gray)
                .imageScale(.large)
                Text("Map")
                .foregroundColor(.gray)
                .font(.headline)
            }
            .padding(.top,30)
            HStack{
                Image(systemName: "gear")
                .foregroundColor(.gray)
                .imageScale(.large)
                Text("Settings")
                .foregroundColor(.gray)
                .font(.headline)
            }
            .padding(.top,30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red:32/255,green:32/255,blue:32/255))
        .edgesIgnoringSafeArea(.all)
}

struct HamburglerView_Previews: PreviewProvider {
    static var previews: some View {
        HamburglerView()
    }
}
}
