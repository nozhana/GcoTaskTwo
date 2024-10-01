//
//  Config.swift
//  GcoTaskTwo
//
//  Created by Nozhan Amiri on 10/1/24.
//

import Foundation

class Config: ObservableObject, Codable, Equatable {
    static func == (lhs: Config, rhs: Config) -> Bool {
        lhs.option == rhs.option && lhs.toggle == rhs.toggle
    }
    
    enum Option: Int, Codable, CaseIterable {
        case first = 0, second, third
    }
    
    @Published var option: Option
    @Published var toggle: Bool
    
    enum CodingKeys: CodingKey {
        case option
        case toggle
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(option, forKey: .option)
        try container.encode(toggle, forKey: .toggle)
    }
    
    init(option: Option = .first, toggle: Bool = false) {
        self.option = option
        self.toggle = toggle
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.option = try container.decode(Option.self, forKey: .option)
        self.toggle = try container.decode(Bool.self, forKey: .toggle)
    }
}
