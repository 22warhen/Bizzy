//
//  YelpManager.swift
//  Bizzy
//
//  Created by Henry Warren on 6/1/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import Foundation
import CDYelpFusionKit
import SwiftLocation
import SwiftUI
func rounder(_ value: Double, toNearest: Double) -> Double {
    return round(value / toNearest) * toNearest
}
func forTrailingZero(temp: Double) -> String {
       let roundDouble = String(format: "%g", temp)
       return roundDouble
   }
class YelpManager : ObservableObject {
    @Published var indivBusiId : String = ""
    @Published var locSucc : Bool = false
    var currentOffset : Int = 0
    var autoSearchId : [CDYelpBusiness] = []
    @Published var mainBusinessList : [CDYelpBusiness] = []
    var currentlyLoading = false
    var startIndex : Int {mainBusinessList.startIndex}
    var endIndex : Int {mainBusinessList.endIndex}
    
    //get current position of business items
    subscript(position: Int) -> CDYelpBusiness{
        return mainBusinessList[position]
    }
    
    
    //load initial businesses with an offset of Int(0)
    func loadBusinesses() {
        //sets autoSearchId to business
        defer{
        self.autoSearchIdentifier(offset: 0)
        mainBusinessList = autoSearchId
        self.currentlyLoading = false
        }}
    
    
    
    
    //load more businesses, duh...
    func loadMoreBusinesses(currentItem: CDYelpBusiness? = nil) {
        if !shouldLoadMoreData(currentItem: currentItem){
            return
        }
        if currentOffset >= 64 {
            return
        }
        else{
        currentlyLoading = true
        autoSearchIdentifier(offset: currentOffset)
        self.mainBusinessList.append(contentsOf: autoSearchId)
        currentOffset += 16
        }
    }
    
    
    
    
    func shouldLoadMoreData(currentItem: CDYelpBusiness? = nil) -> Bool {
        if currentlyLoading {
            return false
        }
        guard let currentItem = currentItem else {
            return true
        }
        guard let lastItem = mainBusinessList.last else {
            return true
        }
        //if current id matches the last id of the requested business ids
        for n in (mainBusinessList.count - 4)...(mainBusinessList.count-1){
            if n >= 0 && currentItem.id == mainBusinessList[n].id{
                return true
            }
        }
        return false
    }
    
    
    
    let x: () = LocationManager.shared.locateFromGPS(.continous, accuracy: .house) {result in
    switch result {
      case .failure(let error):
        if error.localizedDescription .contains("requiredLocationNotFound"){
        }
        debugPrint("Received error: \(error)")
      case .success(let location):
        return
    }
    }.dataFrequency = .fixed(minInterval: 40, minDistance: 100)

    func autoSearchIdentifier(offset : Int) {
        var returnBusinessesList : [CDYelpBusiness]?
        defer{
        print("loading...")
        yelpAPIClient.searchBusinesses(byTerm: nil,
                                    location: nil,
                                    latitude: (LocationManager.shared.lastLocation?.coordinate.latitude),
                                    longitude: (LocationManager.shared.lastLocation?.coordinate.longitude),
                                    radius: 4828,
                                    categories: [.grocery,.shopping,.departmentStores],
                                    locale: .english_unitedStates,
                                    limit: 15,
                                    offset: offset,
                                    sortBy: .distance,
                                    priceTiers: nil,
                                    openNow: nil,
                                    openAt: nil,
                                    attributes: nil) { (response) in
       print("loading done")
            if let response = response,
           let businesses = response.businesses,
           businesses.count > 0 {
                self.currentlyLoading = false
                returnBusinessesList = businesses
                self.autoSearchId = businesses
                print(businesses[1].id)
                
}
     else {
                self.currentlyLoading = false
     debugPrint("error no businesses")
            }
            }
    }
        
        
        
        }
        
    }


