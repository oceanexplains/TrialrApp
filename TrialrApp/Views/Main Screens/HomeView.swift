//
//  HomeView.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI

enum AppState {
    case saved, settings, search, results
}

struct HomeView: View {
    
    @State var appState: AppState = .saved
    var body: some View {
        ZStack {
            switch appState {
            case .saved:
                SavedStudiesView()
            case .search:
                SearchView()
            case .results:
                SearchResultsView()
            case .settings:
                SettingsView()
            }
            MenuButtonView(appState: $appState, menuState: .button)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



