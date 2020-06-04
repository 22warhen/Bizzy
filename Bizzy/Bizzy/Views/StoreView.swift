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
import RemoteImage
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
        ZStack (alignment: .topTrailing) {
            VStack {
                Group {
                
                ZStack(alignment:.topLeading){
                    NavigationView{
                    List(self.yelpManager.mainBusinessList, id: \.id){
                        business in
                        
                            VStack{
                                HStack{
                                    Spacer()
                                    //print number of miles away from meters
                                    Text("\(forTrailingZero(temp: round(business.distance!*0.000621371/0.1)*0.1)) mi")
                                }
                                Spacer()
                                GeometryReader {geo in
                                    
                                ZStack (alignment: .center){
//                                    if business.imageUrl != nil{
//                                        URLImage((business.imageUrl!), processors: [Resize(size: CGSize(width: geo.size.width, height: 100), scale: UIScreen.main.scale)], content:  {
//                                            $0.image
//                                            .resizable()
//                                            .frame(width:geo.size.width, height: 100)
//                                            )
//
//                                        }
                                    if business.imageUrl != nil{
                                    RemoteImage(type: .url(business.imageUrl!), errorView: { error in
                                        Text(error.localizedDescription)
                                        }, imageView: { image in
                                            image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 50)
                                        }, loadingView: {
                                            Text("Loading ...")
                                        })
                                }
                                    }}
                          
                                HStack{
                                Text("\(business.name!)")
                                    .font(.largeTitle)
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer()
                                    Text("\(1)")
                                    Image(systemName: "person")
                                }//.padding(.horizontal)
                                
                    }

                        .onAppear(){
                        self.yelpManager.loadMoreBusinesses(currentItem: business)
                                           }

                    }
                        .navigationBarTitle(Text("Businesses Near You"))
                    .navigationBarItems(trailing:
                        Button(action: {self.yelpManager.loadBusinesses()
                            print("refreshed")})
                            {Text("Refresh")})
                
                        //.listRowBackground(Color.red)
                   // .padding(.vertical, 50)
                    
                    }
                    
                    //self.networkManager.getBusinessesAtLocation()
                        //self.localBusiness = self.networkManager.root
                        // Query Yelp Fusion API for business results
                    
                    }
                .overlay(MenuButton())
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


