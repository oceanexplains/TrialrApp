//
//  API Models.swift
//  TrialrApp
//
//  Created by Ocean on 2/16/23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let studyFieldsResponse: StudyFieldsResponse

    enum CodingKeys: String, CodingKey {
        case studyFieldsResponse = "StudyFieldsResponse"
    }
}

// MARK: - StudyFieldsResponse
struct StudyFieldsResponse: Codable {
    let apiVrs, dataVrs, expression: String
    let nStudiesAvail, nStudiesFound, minRank, maxRank: Int
    let nStudiesReturned: Int
    let fieldList: [String]
    let studyFields: [StudyField]

    enum CodingKeys: String, CodingKey {
        case apiVrs = "APIVrs"
        case dataVrs = "DataVrs"
        case expression = "Expression"
        case nStudiesAvail = "NStudiesAvail"
        case nStudiesFound = "NStudiesFound"
        case minRank = "MinRank"
        case maxRank = "MaxRank"
        case nStudiesReturned = "NStudiesReturned"
        case fieldList = "FieldList"
        case studyFields = "StudyFields"
    }
}

// MARK: - StudyField
struct StudyField: Codable {
    let rank: Int
    let orgStudyID, nctID, briefTitle, condition, targetDuration: [String]
    let centralContactName, centralContactPhone, centralContactEMail, locationFacility: [String]

    enum CodingKeys: String, CodingKey {
        case rank = "Rank"
        case orgStudyID = "OrgStudyId"
        case nctID = "NCTId"
        case briefTitle = "BriefTitle"
        case condition = "Condition"
        case targetDuration = "TargetDuration"
        case centralContactName = "CentralContactName"
        case centralContactPhone = "CentralContactPhone"
        case centralContactEMail = "CentralContactEMail"
        case locationFacility = "LocationFacility"
    }
}
