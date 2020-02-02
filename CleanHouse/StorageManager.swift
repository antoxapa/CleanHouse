//
//  StorageManager.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 1/11/20.
//  Copyright © 2020 TonyPo Production. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ object: CompaniesRealm) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    static func deleteObject(_ object: CompaniesRealm) {
        try! realm.write {
            realm.delete(object)
        }
    }
    static func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
