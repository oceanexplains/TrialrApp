//
//  SavedStudiesView.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI

struct SavedStudiesView: View {
    
    @AppStorage("URL") var URL: String = ""
    
    @Binding var appState: AppState
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

