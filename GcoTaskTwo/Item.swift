//
//  Item.swift
//  GcoTaskTwo
//
//  Created by Nozhan Amiri on 10/1/24.
//

import Foundation

class Item: ObservableObject {
    @Published var configs: [Config] = []
    
    func loadDefaultConfigs() {
        @Defaults(storage: .local) var configs: [Config] = Array(repeating: Config(), count: 3)
        self.configs = configs
    }
    
    func persistChanges() {
        @Defaults(storage: .local) var configs: [Config] = []
        configs = self.configs
    }
}
