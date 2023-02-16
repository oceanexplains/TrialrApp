//
//  MenuButtonView.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI

enum MenuState {
    case button, menu, surprise
}

struct MenuButtonView: View {
    @Binding var appState: AppState
    @State var menuState: MenuState
    
    var body: some View {
        switch menuState {
        case .button:
            FloatingButtonView()
        case .menu:
            FloatingMenuView()
        case .surprise:
            Text("Surprise!")
        }
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView(appState: Binding.constant(.saved), menuState: .button)
    }
}

struct FloatingButtonView: View {
    
    var body: some View {
        Text("")
    }
}

struct FloatingMenuView: View {
    
    var body: some View {
        Text("")
    }
}
