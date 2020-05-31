//
//  AppDelegate.swift
//  Bizzy
//
//  Created by Henry Warren on 5/15/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import UIKit
import Firebase
import Moya
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let service = MoyaProvider<YelpService.BusinessProvider>()
    let jsonDecoder = JSONDecoder()
    let locationService = LocationServices()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Override point for customization after application launch.
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        service.request(.search(lat: 42.361145, long: -71.0507083)) {(result) in
            switch result {
            case .success(let response):
                let root = try? self.jsonDecoder.decode(Root.self, from: response.data)
                print(root)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

