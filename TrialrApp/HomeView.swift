//
//  HomeView.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var state: AppState = .saved
    var body: some View {
        switch state {
        case .saved:
            SavedStudiesView()
        case .search:
            SearchView()
        case .results:
                SearchResultsView()
        case .settings:
            SettingsView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


enum AppState {
    case saved, settings, search, results
}
