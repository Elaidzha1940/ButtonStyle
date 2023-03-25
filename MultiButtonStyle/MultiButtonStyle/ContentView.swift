//
//  ContentView.swift
//  MultiButtonStyle
//
//  Created by Elaidzha Shchukin on 25.03.2023.
//

import SwiftUI

protocol ButtonState: CaseIterable {
    
    var title: String { get }
}

extension ButtonState where Self: RawRepresentable, RawValue == String {
    
    var title: String {
        self.rawValue
    }
}

enum OvenState: String, ButtonState {
    
    case Default = "Default"
    case Pressed = "Pressed"
    case Disabled = "Disabled"
}

struct StateButton<: T ButtonState>: View {
    var body: some View {
        
        Text("State Button")
    }
}

struct ContentView: View {
    
    let states: [T]
    
    var body: some View {
        
       StateButton()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
