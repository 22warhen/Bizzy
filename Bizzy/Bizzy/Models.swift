//
//  Models.swift
//  Bizzy
//
//  Created by Henry Warren on 5/28/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
//import Moya
import SwiftLocation

struct Business : Codable, Identifiable {
    let name: String
    let imageUrl: URL
    let distance: Double
    let id: String

}



//class NetworkManager : ObservableObject {
//    let service = MoyaProvider<YelpService.BusinessProvider>()
//    let jsonDecoder = JSONDecoder()
//    let locationService = LocationServices()
//    var didChange = PassthroughSubject<NetworkManager,Never>()
//    @State var root : [Business] = []
//    
//    func getBusinessesAtLocation() -> Void {
//        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//        var loco = LocationManager.shared.locateFromGPS(.oneShot, accuracy: .house, result: .none)
//          service.request(.search(lat: 42.361145, long: -71.0507083)) {(result) in
//        switch result {
//        case .success(let response):
//            self.root = try! self.jsonDecoder.decode([Business].self, from: response.data)
//            print(self.root)
//        case .failure(let error):
//            print("Error: \(error)")
//            }}
//    }
//}
