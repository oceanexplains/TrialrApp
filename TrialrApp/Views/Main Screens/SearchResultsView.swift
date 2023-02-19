//
//  SearchResultsView.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI

struct SearchResultsView: View {
//    @AppStorage("sampleURL") var URLQuery: String = ""
    
    
    let URLQuery: String = "https://clinicaltrials.gov/api/query/study_fields?expr=heart+attack&fields=OrgStudyId%2CBriefTitle%2CCondition%2CTargetDuration%2CCentralContactName%2CCentralContactPhone%2CCentralContactEmail%2CLocationFacility&min_rnk=1&max_rnk=&fmt=json"
    
    @State var results: [StudyField] = []
    @State var saved: [String] = []
    
    var body: some View {

        List(results, id: \.orgStudyID[0]) { study in
            StudyRowItemView(study: study)
                .contextMenu {
                    Button(action: {
                        
                    }) {
                        Text("Option 1")
                        Image(systemName: "circle")
                    }
                    Button(action: {
                        // Option 2 action
                    }) {
                        Text("Option 2")
                        Image(systemName: "square")
                    }
                }
        }
        .task {
            print("task starts")
            await loadData()
        }
    }
    
    func saveStudy(study: StudyField) {
        saved.append(study.orgStudyID[0])
        let defaults = UserDefaults.standard
        defaults.set(saved, forKey: "SavedStudies")
    }
    
    func loadData() async {
        print("loadData begins")
        guard let url = URL(string: URLQuery) else {
            print("Invalid URL")
            return
        }
        
        do {
            print("loadingData")
            //Extract data from url
            let (data,_) = try await URLSession.shared.data(from: url)
            //Decode data from url
            if let decodedResponse = try? JSONDecoder().decode(Welcome.self, from: data) {
                results = decodedResponse.studyFieldsResponse.studyFields
            }
            print("Data loaded")
        } catch {
            print("Invalid Data")
        }
    }
}

