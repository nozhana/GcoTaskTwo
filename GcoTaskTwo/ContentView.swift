//
//  ContentView.swift
//  GcoTaskTwo
//
//  Created by Nozhan Amiri on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var item = Item()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<item.configs.count, id: \.self) { index in
                    ConfigView(config: $item.configs[index])
                        .onChange(of: item.configs[index].option) { _ in
                            item.persistChanges()
                        }
                        .onChange(of: item.configs[index].toggle) { _ in
                            item.persistChanges()
                        }
                } // :ForEach
                ItemSummaryView(item: item)
            } // :List
            .navigationTitle("Configure items")
            .onAppear {
                item.loadDefaultConfigs()
            }
        } // :NavigationStack
    }
}

#Preview {
    ContentView()
}
