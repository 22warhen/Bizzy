//
//  WeNeedIt.swift
//  Bizzy
//
//  Created by Henry Warren on 5/27/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI
func textSize(textStyle: UIFont.TextStyle) -> CGFloat {
   return UIFont.preferredFont(forTextStyle: textStyle).pointSize
}
struct WeNeedIt: View {
    var locationService : LocationManager
    @EnvironmentObject var viewRouter : ViewRouter
    var body: some View {
        ZStack {
           // Color("bizzyColor")
                       //.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                Image(systemName: "location.circle.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 200,height: 200)
                    .padding(50)
                
                Text("Need Your Location")
                    .font(.custom("Avenir Next", size: textSize(textStyle: .largeTitle)))
                    .foregroundColor(.black)
                Text("Without your location, you won't be able to use Bizzy.")
                    .font(.system(size: 20))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(UIColor.darkGray))
                Spacer()
            }
            VStack(){
                Spacer()
                VStack(spacing: 2){
                    Button(action: {//self.viewRouter.animationType = (.easeIn(duration: 4))
                        self.locationService.requestLocationAuthorization()
                        self.locationService.requestLocationAuthorization()
                    //self.viewRouter.currentPage = "page1"
                    
                    }){
                    
                    Text("Continue")
                        .font(.custom("Avenir Next", size: textSize(textStyle: .largeTitle)))
                        .foregroundColor(.white)}
                    .frame(width: 300, height: 50)
                        .background(Color.red).clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                Button(action: {self.viewRouter.currentPage = "page0"}){
                Text("Exit App")
                    .font(.custom("Avenir Next", size: textSize(textStyle: .body)))
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 40)
                    
                }
    
                }
                
            }
        }
    }
}

struct WeNeedIt_Previews: PreviewProvider {
    static var previews: some View {
        WeNeedIt(locationService: LocationManager()).environmentObject(ViewRouter())
    }
}
