//
//  DataStore.swift
//  Where-was-i
//
//  Created by Jose Melendez on 8/31/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import Foundation

struct StorageKeys {
    
    
    static let storedLat = "storedLat"
    
    static let storedLong = "storedLong"
}

class DataStore {
    
    func getDefaults() -> UserDefaults {
        
        return UserDefaults.standard
    
    }
    
    func storeDataPoint(latitude: String, longitude: String){
        
        let def = getDefaults()
        
        def.setValue(latitude, forKey: StorageKeys.storedLat)
        def.setValue(longitude, forKey: StorageKeys.storedLong)
        
        
        def.synchronize()
        
        print(latitude + longitude)
    }
    
}
