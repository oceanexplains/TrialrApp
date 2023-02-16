//
//  SearchView.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var isShowingURL: Bool = false
    enum Sex: String, Identifiable, CaseIterable{
        case male, female, other
        var id: Self { self }
    }
    @State private var age = "23"
    @State private var sex: Sex = .male
    @State private var gender: Sex = .female
    //@State private var isGenderBased: Bool = false
    @State private var okayWithMistmatch: Bool = true
    
    @State private var searchByStudyLocation: Bool = false
    @State private var studyState: String = ""
    @State private var studyCity: String = ""
    @State private var studyZip: String = ""
    @State private var studyInstitution: String = ""
    
    enum InterventionType: String, CaseIterable, Identifiable {
        case drug, device, vaccine, procedure, radiation, behavioral, genetic, supplement, combination, diagnostic, other, any
        var id: Self { self }
    }
    enum StudyStatus: String, CaseIterable, Identifiable {
        case notYetRecruiting, recruiting, enrollingByInvitation, active, notRecruiting, completed, suspended, terminated, withdrawn
        var id: Self { self }
    }
    @State private var searchByStudyDetails: Bool = false
    @State private var intervention: InterventionType = .any
    @State private var healthyVolunteers: Bool = true
    @State private var studyStatus: StudyStatus = .active
    @State private var date = Date.now
    
    @State private var theURL: String = ""
    
    var body: some View {
        VStack {
            Text("FIND A STUDY").font(.system(size: 20))
            Form {
                Section("Demographics"){
                    HStack {
                        Text("Age: ")
                        Spacer()
                        TextField("Age", text: $age)
                            .keyboardType(.decimalPad)
                    }
                    HStack {
                        Text("Sex:")
                        Spacer()
                        Picker("Sex", selection: $sex) {
                            ForEach(Sex.allCases) { sex in
                                Text(sex.rawValue.capitalized)
                                }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    HStack {
                        Text("Gender:")
                        Spacer()
                        Picker("Gender", selection: $gender) {
                            ForEach(Sex.allCases) { sex in
                                Text(sex.rawValue.capitalized)
                                }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    if sex != gender {
                        Toggle("Do you want to see studies which match your sex but not gender?", isOn: $okayWithMistmatch)
                    }
                }
                Section("Study Location"){
                    Toggle("Do you want to search by location?", isOn: $searchByStudyLocation)
                    if searchByStudyLocation{
                        HStack{
                            Text("Zip Code")
                            Spacer()
                            TextField("Zip Code", text: $studyZip)
                        }
                        HStack{
                            Spacer()
                            Text("OR")
                            Spacer()
                        }
                        HStack{
                            Text("City")
                            Spacer()
                            TextField("City", text: $studyCity)
                        }
                        HStack{
                            Text("State")
                            Spacer()
                            TextField("State", text: $studyState)
                        }
                        HStack{
                            Spacer()
                            Text("OR")
                            Spacer()
                        }
                        HStack{
                            Text("Institution")
                            Spacer()
                            TextField("Institution", text: $studyInstitution)
                        }
                    }
                }
                Section("Study Details"){
                    Toggle("Do you want to search by study details?", isOn: $searchByStudyDetails)
                    if searchByStudyDetails{
                        HStack{
                            Picker("Intervention", selection: $intervention) {
                                ForEach(InterventionType.allCases) { intervention in
                                    Text(intervention.rawValue.capitalized)
                                    }
                            }.pickerStyle(MenuPickerStyle())
                        }
                        Toggle("Healthy Participants", isOn: $healthyVolunteers)
                        HStack{
                            Picker("Status", selection: $studyStatus) {
                                ForEach(StudyStatus.allCases) { studyStatus in
                                    Text(studyStatus.rawValue.capitalized)
                                    }
                            }.pickerStyle(MenuPickerStyle())
                        }
                        DatePicker(selection: $date,
                            in: ...Date(),
                            displayedComponents: .date,
                            label: {
                                Text("Date")
                            }
                        )
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
