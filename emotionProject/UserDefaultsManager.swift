//
//  UserDefaultsManager.swift
//  emotionProject
//
//  Created by 염성필 on 2023/07/26.
//

import UIKit

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private init() { }
    
    func loadData(key: String) -> [Int:Int]? {
        return UserDefaults.standard.object([Int: Int].self, with: key)
    }
    
    func saveData(_ btnClickAddCount: Dictionary<Int,Int>) {
        UserDefaults.standard.set(object: btnClickAddCount, forKey: "btnClickAddCount")
    }
    
    
}



