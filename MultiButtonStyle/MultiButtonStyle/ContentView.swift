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

struct StateButton<T : ButtonState>: View {
    
    let states: [T]
    @State var currentIndex = 0
    @Binding var selectedState: T
    
    var body: some View {
        
        Button {
            // action
            currentIndex = currentIndex < states.count - 1 ? currentIndex + 1 : 0
            selectedState
        } label: {
            Text(states[currentIndex].title)
                .frame(maxWidth: 155)
        }.buttonStyle(.borderedProminent)
    }
}

struct ContentView: View {
    
    @State var selectedState: OvenState
    var body: some View {
        
        StateButton(states: OvenState.allCases, selectedState: $selectedState)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedState: .Default)
    }
}
