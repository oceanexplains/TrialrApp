//
//  TrialrAppApp.swift
//  TrialrApp
//
//  Created by Ocean on 2/16/23.
//

import SwiftUI

@main
struct TrialrAppApp: App {
    
    @AppStorage("sampleURL") var sampleURL: String = "https://clinicaltrials.gov/api/query/study_fields?expr=heart+attack&fields=OrgStudyId%2CBriefTitle%2CCondition%2CTargetDuration%2CCentralContactName%2CCentralContactPhone%2CCentralContactEmail%2CLocationFacility&min_rnk=1&max_rnk=&fmt=json"
    @AppStorage("URL") var url: String = ""
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
