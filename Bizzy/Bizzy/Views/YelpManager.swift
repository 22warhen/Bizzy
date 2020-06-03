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
    @Published var locSucc : Bool = false
    var currentOffset : Int = 0
    @Published var autoSearchId : [CDYelpBusiness] = []
    var currentlyLoading = false
    var startIndex : Int {autoSearchId.startIndex}
    var endIndex : Int {autoSearchId.endIndex}
    
    //get current position of business items
    subscript(position: Int) -> CDYelpBusiness{
        return autoSearchId[position]
    }
    //load initial businesses with an offset of Int(0)
    func loadBusinesses() {
        //run this all the way through
            //sets autoSearchId to business
        self.autoSearchId = self.autoSearchIdentifier(offset: self.currentOffset)
        print("Count of Businesses: \(autoSearchId.count)")
        self.currentlyLoading = false
    }
    
    //load more businesses, duh...
    func loadMoreBusinesses(currentItem: CDYelpBusiness? = nil) {
        if !shouldLoadMoreData(currentItem: currentItem){
            return
        }
        currentlyLoading = true
        currentOffset += 16
        let newData = autoSearchIdentifier(offset: currentOffset)
        self.autoSearchId.append(contentsOf: newData)
    }
    
    func shouldLoadMoreData(currentItem: CDYelpBusiness? = nil) -> Bool {
        if currentlyLoading {
            return false
        }
        guard let currentItem = currentItem else {
            return true
        }
        guard let lastItem = autoSearchId.last else {
            return true
        }
        //if current id matches the last id of the requested business ids
        return currentItem.id == lastItem.id
        
        return true
    }
    var req = LocationManager.shared.locateFromGPS(.continous, accuracy: .house) {result in
    switch result {
      case .failure(let error):
        if error.localizedDescription .contains("requiredLocationNotFound"){
        }
        debugPrint("Received error: \(error)")
      case .success(let location):
        return
    }
    }.dataFrequency = .fixed(minInterval: 40, minDistance: 100)

    func autoSearchIdentifier(offset : Int) -> [CDYelpBusiness] {
        
        var returnBusinessesList : [CDYelpBusiness]? = []
         yelpAPIClient.searchBusinesses(byTerm: nil,
                                    location: nil,
                                    latitude: (LocationManager.shared.lastLocation?.coordinate.latitude),
                                    longitude: (LocationManager.shared.lastLocation?.coordinate.longitude),
                                    radius: 10000,
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
        print(businesses[1].id)
         print("\(businesses)")
                
}
     else {
                self.currentlyLoading = false
     debugPrint("error no businesses")
            }
    }
        
        print("loading...")
        return returnBusinessesList ?? []
        }
    }


