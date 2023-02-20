//
//  ContentView.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            AuroraView()
                .ignoresSafeArea()
            HomeView()
                .padding()
        }
//        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
