//
//  SearchResultsView.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI

struct SearchResultsView: View {
    @AppStorage("URL") var URLQuery: String = ""
    
    
    //let URLQuery: String = "https://clinicaltrials.gov/api/query/study_fields?expr=(AREA%5BMinimumAge%5DRANGE%5BMIN,23+years%5D)+AND+(AREA%5BMaximumAge%5DRANGE%5B23+years,MAX%5D)+AND+(AREA%5BOverallStatus%5DActive)+AND+(AREA%5BGenderBased%5Dtrue+AND+AREA%5BGender%5Dfemale)+OR+AREA%5BGender%5Dmale+AND+((AREA%5BStartDate%5DRANGE%5BMIN,12/14/2022%5D))&fields=OrgStudyId,NCTId,BriefTitle,Condition,TargetDuration,CentralContactName,CentralContactPhone,CentralContactEmail,LocationFacility&fmt=JSON"
    
    @State var results: [StudyField] = []
    @State var saved: [String] = []
    
    @State var isSharing: Bool = false
    @State var shareText: String = "Bananas"
    
    var body: some View {

        NavigationView {
            List(results, id: \.nctID[0]) { study in
                let isSaved = saved.contains(study.nctID[0])
                StudyRowItemView(study: study, isSaved: isSaved)
                    .contextMenu {
                        if isSaved {
                            Button(action: {
                                unsaveStudy(study)
                            }) {
                                Text("Unsave Study")
                                Image(systemName: "heart.circle")
                            }
                        } else {
                            
                            Button(action: {
                                saveStudy(study)
                            }) {
                                Text("Save Study")
                                Image(systemName: "heart.circle.fill")
                            }
                            
                            Button(action: {
                                
                                shareText = "Check out this study:"// \(study.briefTitle.first ?? "")"
                                isSharing = true
                            }) {
                                Text("Share with friends!")
                                Image(systemName: "square.and.arrow.up")
                            }
                        }
                        
                    }
            }
            .task {
                print("task starts")
                await loadData()
            }
            .navigationTitle("Search Results")
            .sheet(isPresented: $isSharing) {
                ShareView(activityItems: [shareText])
            }
        }
        
    }
    
    func saveStudy(_ study: StudyField) {
        saved.append(study.nctID[0])
        let defaults = UserDefaults.standard
        defaults.set(saved, forKey: "SavedStudies")
    }
    
    func unsaveStudy(_ study: StudyField) {
        saved.removeAll { $0 == study.nctID[0] }
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

