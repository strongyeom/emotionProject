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

extension UserDefaults {
    func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }
    
    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        self.set(data, forKey: key)
    }
}

