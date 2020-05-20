//
//  MainView.swift
//  Bizzy
//
//  Created by Henry Warren on 5/18/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
@State var open = false
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading){
            HStack(alignment: .top) {
                        Button(action: {self.open.toggle()
                        }){
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
            VStack{
                
                Button(action:{
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
                
               /* Button(action: { DatabaseManager.root.collection("users").document("qAYViTObQWRb0wbIjUVc").collection("publicData").document("publicData").setData(["name": "Bingius Bongus"], merge: true){(err) in
                    if let err = err {
                        print(err.localizedDescription)
                    }
                    }
                    print("Successully set data")
                
                })
                {Text("Hello")}*/
                
            }
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
