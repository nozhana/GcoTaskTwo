//
//  ItemSummaryView.swift
//  GcoTaskTwo
//
//  Created by Nozhan Amiri on 10/1/24.
//

import SwiftUI

struct ItemSummaryView: View {
    @ObservedObject var item: Item
    
    var body: some View {
        VStack {
            ForEach(0..<item.configs.count, id: \.self) { index in
                HStack {
                    Text("Option: \(item.configs[index].option.rawValue)")
                    Spacer()
                    Text("Toggle: \(item.configs[index].toggle.description)")
                } // :HStack
            } // :ForEach
        } // :VStack
    }
}
