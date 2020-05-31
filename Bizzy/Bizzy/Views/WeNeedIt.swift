//
//  WeNeedIt.swift
//  Bizzy
//
//  Created by Henry Warren on 5/27/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI
import SwiftLocation
func textSize(textStyle: UIFont.TextStyle) -> CGFloat {
   return UIFont.preferredFont(forTextStyle: textStyle).pointSize
}
struct WeNeedIt: View {
    
    var locationService : LocationServices
    @EnvironmentObject var viewRouter : ViewRouter
    @State var a = 2
    @State var count = 4
    @State var buttonClick = 1
    @State var secondButtonClick = false
    var body: some View {
        _ = LocationManager.shared.onAuthorizationChange.add { newState in
          print("Authorization status changed to \(newState)")
        }
//        if self.locationService.status == .authorizedAlways {
//            self.viewRouter.currentPage = "page1"
//        }
//        if self.locationService.status == .authorizedWhenInUse {
//            print("yay")
//            self.a = 1
//        }
//        self.locationService.alwaysInUse = {
//        success in
//            if success {
//                print(self.locationService.getLocation())
//                self.locationService.newLocation = {
//                    result in
//                    switch result {
//                    case .success(let location):
//                        print(location)
//                    case .failure(let error):
//                        assertionFailure("Error getting location \(error)")
//                    }}}}
          return ZStack {
            
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
                    .foregroundColor(Color("bowob"))
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
                    Button(action: {
                        //self.viewRouter.animationType = (.easeIn(duration: 4))
//                        if self.locationService.status == .denied {
//                            LocDenied()
//                        }
//                        print(self.locationService.status.rawValue)
//
//                        self.locationService.requestLocationAuthorization()
                        //self.locationService.requestLocationAuthorization()
                        LocationManager.shared.requireUserAuthorization(.whenInUse)
                        if self.buttonClick > 1 {
                            LocationManager.shared.requireUserAuthorization(.always)
                            self.viewRouter.currentPage = "page0.1"
                        }
                        else {
                            LocationManager.shared.requireUserAuthorization(.whenInUse)
                        }
                        self.buttonClick += 1
                        self.a-=1

                    })
                    {
                    
                    Text("Continue (\(a))")
                        .font(.custom("Avenir Next", size: textSize(textStyle: .largeTitle)))
                        .foregroundColor(.white)}
                    .frame(width: 300, height: 50)
                        .background(Color.red).clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    
    
                }
                
            }
            }
            }
            }
struct WeNeedIt_Previews: PreviewProvider {
    static var previews: some View {
        WeNeedIt(locationService: LocationServices()).environmentObject(ViewRouter())
    }

}

