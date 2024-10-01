//
//  Defaults.swift
//  GcoTaskTwo
//
//  Created by Nozhan Amiri on 10/1/24.
//

import Foundation

@propertyWrapper
struct Defaults<V: Codable> {
    private let storage: UserDefaults
    
    init(wrappedValue: V, storage: UserDefaults = .standard) {
        self.storage = storage
        if storage.value(forKey: "\(V.self)") == nil {
            if let jsonData = try? JSONEncoder().encode(wrappedValue),
               let json = String(data: jsonData, encoding: .utf8) {
                storage.setValue(json, forKey: "\(V.self)")
            }
        }
    }
    
    var wrappedValue: V {
        get {
            guard let json = storage.string(forKey: "\(V.self)"),
                  let jsonData = json.data(using: .utf8),
                  let decoded = try? JSONDecoder().decode(V.self, from: jsonData) else { fatalError() }
            return decoded
        }
        set {
            guard let jsonData = try? JSONEncoder().encode(newValue),
                  let json = String(data: jsonData, encoding: .utf8) else { return }
            storage.setValue(json, forKey: "\(V.self)")
        }
    }
}


extension UserDefaults {
    static var local: UserDefaults = {
        let defaults = UserDefaults.standard
        defaults.addSuite(named: "com.nozhana.GcoTaskTwo.local")
        return defaults
    }()
}
