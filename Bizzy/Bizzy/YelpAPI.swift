//
//  YelpAPI.swift
//  Bizzy
//
//  Created by Henry Warren on 5/26/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//
//let business = YLPBusiness()

import Foundation
import Moya
private let apiKey =  "qHwqYbSgMZFbzOeHOQmNdWOYB3q6l9y3HrAZ7dMH_OqDShgd8KplrEKGGiL20qP4QXAFyxueJGB931JaGE6GlAgguoobpf8RfrZpumBINbfXwfGeiqw6snAJ_kTNXnYx"
enum YelpService{
    enum BusinessProvider: TargetType {
        case search(lat: Double, long: Double)
        
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }
        
        var path: String {
            switch self {
            case .search:
                return "/search"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data{
            return Data()
        }
        
        var task: Task {
            switch self {
            case let .search(lat, long):
                return .requestParameters(parameters: ["latitude": lat, "longitude": long, "limit": 1], encoding: URLEncoding.queryString)
                
            }
        }
        
        var headers: [String : String]? {
            return ["Authorization": "Bearer \(apiKey)"]
        }
    
    }
}
