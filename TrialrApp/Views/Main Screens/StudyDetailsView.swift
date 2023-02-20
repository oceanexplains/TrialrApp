//
//  StudyDetailsView.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/19/23.
//
//https://clinicaltrials.gov/api/gui/ref/responses

import SwiftUI

struct StudyDetailsView: View {
    
    @State var study: FullStudy
//    @State var study: StudyField
    
    @State var showPrimaryContact: Bool = false
    @State var showIntervention: Bool = false
    @State var showEligibility: Bool = false
    @State var showDetailedDescription: Bool = false
    @State var showSummary: Bool = false
    @State var showConditionDetails: Bool = false
    @State var showCentralContact: Bool = false
//    @State var showEligibility: Bool = false
//    @State var showEligibility: Bool = false
//    @State var showEligibility: Bool = false
//    @State var showEligibility: Bool = false
//    @State var showEligibility: Bool = false
//    @State var showEligibility: Bool = false

    
    var body: some View {
        VStack {
            List {
//                Group {
//                    Section("Contact Info") {
//                        Toggle("Show Primary Contact Details", isOn: $showPrimaryContact)
//                        if showPrimaryContact {
//                            DetailItemView(title: "Title", text: <#T##String#>)
//                            DetailItemView(title: "Phone", text: <#T##String#>)
//                            DetailItemView(title: "Phone Extension", text: <#T##String#>)
//                            DetailItemView(title: "eMail", text: <#T##String#>)
//                            DetailItemView(title: "Primary Contact", text: <#T##String#>)
//                        }
//                        Toggle("Show Central Contact Details", isOn: $showCentralContact)
//                        if showCentralContact {
//                            DetailItemView(title: "Central Contact", text: <#T##String#>)
//                            DetailItemView(title: "Central Contact", text: <#T##String#>)
//                            DetailItemView(title: "Central Contact", text: <#T##String#>)
//                            DetailItemView(title: "Central Contact", text: <#T##String#>)
//                            DetailItemView(title: "Central Contact", text: <#T##String#>)
//                        }
//                    }
//
//                }
                Group {
                    Section("Study Details") {
                        Toggle("Show Intervention Details", isOn: $showIntervention)
                        if showIntervention {
                            Text("")
                        }
                        Toggle("Show Condition Details", isOn: $showConditionDetails)
                        if showConditionDetails {
                            Text("")
                        }
                    }
                    Section("Eligibility") {
                        Toggle("Show Eligibility Details", isOn: $showEligibility)
                        if showEligibility {
                            Text("")
                        }
                    }
                    Section("Study Details") {
                        Toggle("Show Summary", isOn: $showSummary)
                        if showDetailedDescription {
                            Text("")
                        }
                        Toggle("Show Detailed Description", isOn: $showDetailedDescription)
                        if showSummary {
                            Text("")
                        }
                    }
                }
            }
        }
    }
}



struct DetailItemView: View {
    var title: String
    var text: String?
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(text ?? "NA")
        }
    }
}
