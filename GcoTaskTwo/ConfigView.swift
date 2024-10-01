//
//  ConfigView.swift
//  GcoTaskTwo
//
//  Created by Nozhan Amiri on 10/1/24.
//

import SwiftUI

struct ConfigView: View {
    @Binding var config: Config
    
    var body: some View {
        HStack {
            Picker("Option", selection: $config.option) {
                ForEach(Config.Option.allCases, id: \.self) { option in
                    Text("\(option.rawValue)").tag(option)
                } // :ForEach
            } // :Picker
            .pickerStyle(.segmented)
            
            Spacer()
            
            Toggle("Toggle", isOn: $config.toggle)
        } // :HStack
    }
}
