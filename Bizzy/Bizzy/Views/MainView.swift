//
//  MainView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/18/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI
struct ContentView: View {
//@State var open = false
    var body: some View {
//        func setView1 {
//        viewRouter.currentPage = "page1"
//        }
        VStack {
            ZStack(alignment:.topLeading){
                
                List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        VStack{
                            HStack{
                                Image(systemName: "map").resizable().aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 50)}
                            Text("Hello")
                            Text("Oh hello there")
                        }
                }.padding(.vertical, 50)
                .overlay(MenuButton())
                
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

