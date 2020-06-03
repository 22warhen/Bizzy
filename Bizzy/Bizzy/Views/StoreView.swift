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
    @State var distanceInMiles : Double?
    @ObservedObject var yelpManager : YelpManager
//@ObservedObject var networkManager : NetworkManager
    @State var localBusiness : [CDYelpBusiness]?
    @State var refreshView = false
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
                    Button(action: {
                    self.yelpManager.loadBusinesses()
                        print(self.yelpManager.autoSearchId[1].id)
                    })
                    {Text("Oh e")}
                }
            }
            VStack {
                Group {
                    
                ZStack(alignment:.topLeading){

                    List(self.yelpManager.autoSearchId, id: \.id){
                        business in
                        
                            VStack{
                                HStack{
                                    Spacer()
                                    //print number of miles away
                                    
                                    Text("\(forTrailingZero(temp: round(business.distance!*0.000621371/0.1)*0.1)) mi")
                                }
                                Spacer()
                                
                                VStack (alignment: .center){
                                    GeometryReader {geo in
                                    Spacer()
                                    if business.imageUrl != nil{
                                        
                                        URLImage((business.imageUrl!), processors: [Resize(size: CGSize(width: geo.size.width, height: geo.size.height*2), scale: UIScreen.main.scale)], content:  {
                                            $0.image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                                .fixedSize(horizontal: true, vertical: true)
                                                .frame(width: geo.size.width, height: geo.size.height*2)
                                         
                                    })
                                        
                                        .frame(width: 200, height: geo.size.height)
                                        
                                        }}
                                    Spacer()
                                    
                                }.clipped()
                                HStack{
                                Text("\(business.name!)")
                                    .font(.largeTitle)
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer()
                                    Text("\(1)")
                                    Image(systemName: "person")
                                }//.padding(.horizontal)

                    }}.id(UUID())
                        //.listRowBackground(Color.red)
                    .padding(.vertical, 50)
                    }.overlay(MenuButton())
                    //self.networkManager.getBusinessesAtLocation()
                        //self.localBusiness = self.networkManager.root
                        // Query Yelp Fusion API for business results
                        .onAppear(){
                            self.yelpManager.loadBusinesses()
                    }
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
        ContentView(yelpManager: YelpManager()).environmentObject(ViewRouter())
        //Menu(open: .constant(true))
    }
}

