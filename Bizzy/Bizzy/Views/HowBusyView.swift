//
//  HowCrowdedView.swift
//  Bizzy
//
//  Created by Henry Warren on 6/1/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI

struct HowBusy: View {
    @State var clickedStore = "it here"
    @State var clickedStoreAddress = "Near Current Location"
    var body: some View {
        VStack {
            Image(systemName: "person.3.fill").resizable().scaledToFit().foregroundColor(Color.blue).frame(width: 200, height: 120).padding(.top)
            //Spacer()
                VStack (spacing: 5){
                    
                Text("How busy is \(clickedStore) right now?")
                    .font(.custom("Avenir Next", size: 40)).multilineTextAlignment(.center)
                    .foregroundColor(Color("bizzyColor"))
                HStack (alignment: .center){
                Image(systemName: "location")
                Text("\(clickedStoreAddress)")
                    .fontWeight(.light)
                    }
                    
            }
            VStack (spacing: 25){
            Button(action: {print("good")})
            {
                
                        
                        VStack{
                        VStack {
                            HStack{Text("Good")
                            .font(.largeTitle)
                                .fontWeight(.light)
                            .foregroundColor(.primary)}
                            HStack (spacing: 2){
                                Text("Can easily stay 6 feet away from others")
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.center)
                                .foregroundColor(.secondary)
                                
                            }
                            .padding(.horizontal,50)
                        }
                        .frame(maxWidth: 330, maxHeight: 120)
                        .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.green, lineWidth: 5))
                        }
            }
                
            .padding(.top)
            Button(action: {print("busy")})
                {
                VStack {
                    VStack {
                        HStack{Text("Busy")
                        .font(.largeTitle)
                        .foregroundColor(.primary)}
                        HStack (spacing: 2){
                            Text("Challenging to stay 6 feet away from others")
                                .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            
                        }
                        .padding(.horizontal,50)
                    }
            
                    .frame(maxWidth: 330, maxHeight: 120)
                    .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.yellow, lineWidth: 5))
                    }
                    
            }
            
            Button(action: {print("packed")})
                {
                VStack {
                    VStack {
                        HStack{Text("Packed")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.primary)}
                        HStack (spacing: 2){
                            Text("Impossible to social distance")
                            .bold()
                                .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            
                        }
                        .padding(.horizontal,50)
                    }
                    .frame(maxWidth: 330, maxHeight: 120)
                    .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.red, lineWidth: 5))
                    }
                    
            }
            Spacer()
            
            
        }
        }.navigationBarTitle("Businesses Near You")
}

struct HowBusy_Previews: PreviewProvider {
    static var previews: some View {
        HowBusy()
    }
}
}
