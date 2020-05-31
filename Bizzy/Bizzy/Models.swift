//
//  Models.swift
//  Bizzy
//
//  Created by Henry Warren on 5/28/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import Foundation

struct Root: Codable {
    let businesses: [Business]
}

struct Business: Codable {
    let id: String
    let name: String
    let imageUrl : URL
    let distance: Double
}

struct BusinessListViewModel {
    let name: String
    let imageUrl: URL
    let distance: String
    let id: String
}

extension BusinessListViewModel {
    init(business: Business) {
        self.name = business.name
        self.id = business.id
        self.imageUrl = business.imageUrl
        self.distance = "\(business.distance / 1609.344)" //display in miles from meters
    }
}
