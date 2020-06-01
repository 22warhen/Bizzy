//
//  MainView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/18/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI
import URLImage
import CDYelpFusionKit
//import Moya
import SwiftLocation
struct ContentView: View {
//@ObservedObject var networkManager : NetworkManager
    @State var localBusiness : [CDYelpBusiness]?
//    init(){
//    }
//@State var open = false
    var body: some View {
//        func setView1 {
//        viewRouter.currentPage = "page1"
//        }
        ZStack {
                VStack (alignment: .center){
                Spacer()
                HStack{
                    Button(action: {                    yelpAPIClient.searchBusinesses(byTerm: nil,
                                                       location: nil,
                                                       latitude: 37.3318,
                                                       longitude: -122.0312,
                                                       radius: 10000,
                                                       categories: nil,
                                                       locale: .english_unitedStates,
                                                       limit: 5,
                                                       offset: 0,
                                                       sortBy: .rating,
                                                       priceTiers: [.oneDollarSign, .twoDollarSigns],
                                                       openNow: false,
                                                       openAt: nil,
                                                       attributes: nil) { (response) in
                          if let response = response,
                              let businesses = response.businesses,
                              businesses.count > 0 {
                            self.localBusiness = response.businesses
                            print("\(businesses)")
                          }
                        }}) {Text("Oh e")}
                }
            }
            VStack {
                ZStack(alignment:.topLeading){

                    List(0..<2){
                        business in
                        Group {
                            VStack{
                                HStack{
                                    Spacer()
                                    Image(systemName: "map")
                                        
                                        .resizable().aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 50)
                                    Spacer()
                                }
                                HStack{
                                    Text("hw")
                                Spacer()
                                    Text("\(1)")
                                    Image(systemName: "person")
                                }.padding(.horizontal)
        
                            }}
                        .listRowBackground(Color.red)
                    .padding(.vertical, 50)
                    }.overlay(MenuButton())
                    //self.networkManager.getBusinessesAtLocation()
                        //self.localBusiness = self.networkManager.root
                        // Query Yelp Fusion API for business results
                    
                }
            }
        }
        
    }
    
    
}
                /*Button(action:{
                    let userData = [
                    "uid": uid,
                    "name":"bob"]
                    DatabaseManager.referenceForUserPublicData(uid:uid).setData(userData,merge:true) {(err) in
                        if let err = err {
                            print(err.localizedDescription)
                        }
                        }
                        print("Successully set data")
                    
                    })
                    {Text("Hello")}
                
                Button(action: { DatabaseManager.root.collection("users").document("qAYViTObQWRb0wbIjUVc").collection("publicData").document("publicData").setData(["name": "Bingius Bongus"], merge: true){(err) in
                    if let err = err {
                        print(err.localizedDescription)
                    }
                    }
                    print("Successully set data")
                
                })
                {Text("Hello")}*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
        //Menu(open: .constant(true))
    }
}

