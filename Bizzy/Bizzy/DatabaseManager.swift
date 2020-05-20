//
//  DatabaseManager.swift
//  Bizzy
//
//  Created by Henry Warren on 5/19/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import Firebase

struct DatabaseManager {
    static let environment = "dev"
    static let db = Firestore.firestore()
    static let root = db.collection(environment).document(environment)
    
    static func referenceForUserPublicData(uid: String) -> DocumentReference{
        
        return root
            .collection(DatabaseKeys
            .CollectionPath.users)
            .document(uid)
            .collection(DatabaseKeys.CollectionPath.publicData)
            .document(DatabaseKeys.CollectionPath.publicData)
}
}
