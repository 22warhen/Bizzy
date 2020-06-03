//
//  BackButton.swift
//  Bizzy
//
//  Created by Henry Warren on 6/1/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//
import SwiftUI
struct BackButton: View {
    @EnvironmentObject var viewRouter : ViewRouter
    var body: some View {GeometryReader{ geometry in
        ZStack{
        HStack{
            VStack(alignment: .leading){
                Button(action:{self.viewRouter.currentPage = "lastPage"})
                {
                HStack{
                    Image(systemName: "back")
                    .imageScale(.large)
                    Text("Back")
                }
                    .frame(width: 50, height: 50)
                
                }
                       Spacer()
        }
    
        .padding(.horizontal)
        Spacer()
        }
            }
        }
    }
}


struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton().environmentObject(ViewRouter())
    }
}
