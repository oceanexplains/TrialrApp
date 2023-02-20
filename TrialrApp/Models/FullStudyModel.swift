//
//  FullStudyModel.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/19/23.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct FullStudyRequest: Codable {
    let fullStudiesResponse: FullStudiesResponse

    enum CodingKeys: String, CodingKey {
        case fullStudiesResponse = "FullStudiesResponse"
    }
}

// MARK: - FullStudiesResponse
struct FullStudiesResponse: Codable {
    let apiVrs, dataVrs, expression: String
    let nStudiesAvail, nStudiesFound, minRank, maxRank: Int
    let nStudiesReturned: Int
    let fullStudies: [FullStudy]

    enum CodingKeys: String, CodingKey {
        case apiVrs = "APIVrs"
        case dataVrs = "DataVrs"
        case expression = "Expression"
        case nStudiesAvail = "NStudiesAvail"
        case nStudiesFound = "NStudiesFound"
        case minRank = "MinRank"
        case maxRank = "MaxRank"
        case nStudiesReturned = "NStudiesReturned"
        case fullStudies = "FullStudies"
    }
}

// MARK: - FullStudy
struct FullStudy: Codable {
    let rank: Int
    let study: Study

    enum CodingKeys: String, CodingKey {
        case rank = "Rank"
        case study = "Study"
    }
}

// MARK: - Study
struct Study: Codable {
    let protocolSection: ProtocolSection
    let derivedSection: DerivedSection

    enum CodingKeys: String, CodingKey {
        case protocolSection = "ProtocolSection"
        case derivedSection = "DerivedSection"
    }
}

// MARK: - DerivedSection
struct DerivedSection: Codable {
    let miscInfoModule: MiscInfoModule
    let interventionBrowseModule: InterventionBrowseModule

    enum CodingKeys: String, CodingKey {
        case miscInfoModule = "MiscInfoModule"
        case interventionBrowseModule = "InterventionBrowseModule"
    }
}

// MARK: - InterventionBrowseModule
struct InterventionBrowseModule: Codable {
    let interventionMeshList: InterventionMeshList
    let interventionAncestorList: InterventionAncestorList
    let interventionBrowseLeafList: InterventionBrowseLeafList
    let interventionBrowseBranchList: InterventionBrowseBranchList

    enum CodingKeys: String, CodingKey {
        case interventionMeshList = "InterventionMeshList"
        case interventionAncestorList = "InterventionAncestorList"
        case interventionBrowseLeafList = "InterventionBrowseLeafList"
        case interventionBrowseBranchList = "InterventionBrowseBranchList"
    }
}

// MARK: - InterventionAncestorList
struct InterventionAncestorList: Codable {
    let interventionAncestor: [InterventionAncestor]

    enum CodingKeys: String, CodingKey {
        case interventionAncestor = "InterventionAncestor"
    }
}

// MARK: - InterventionAncestor
struct InterventionAncestor: Codable {
    let interventionAncestorID, interventionAncestorTerm: String

    enum CodingKeys: String, CodingKey {
        case interventionAncestorID = "InterventionAncestorId"
        case interventionAncestorTerm = "InterventionAncestorTerm"
    }
}

// MARK: - InterventionBrowseBranchList
struct InterventionBrowseBranchList: Codable {
    let interventionBrowseBranch: [InterventionBrowseBranch]

    enum CodingKeys: String, CodingKey {
        case interventionBrowseBranch = "InterventionBrowseBranch"
    }
}

// MARK: - InterventionBrowseBranch
struct InterventionBrowseBranch: Codable {
    let interventionBrowseBranchAbbrev, interventionBrowseBranchName: String

    enum CodingKeys: String, CodingKey {
        case interventionBrowseBranchAbbrev = "InterventionBrowseBranchAbbrev"
        case interventionBrowseBranchName = "InterventionBrowseBranchName"
    }
}

// MARK: - InterventionBrowseLeafList
struct InterventionBrowseLeafList: Codable {
    let interventionBrowseLeaf: [InterventionBrowseLeaf]

    enum CodingKeys: String, CodingKey {
        case interventionBrowseLeaf = "InterventionBrowseLeaf"
    }
}

// MARK: - InterventionBrowseLeaf
struct InterventionBrowseLeaf: Codable {
    let interventionBrowseLeafID, interventionBrowseLeafName: String
    let interventionBrowseLeafAsFound: String?
    let interventionBrowseLeafRelevance: InterventionBrowseLeafRelevance

    enum CodingKeys: String, CodingKey {
        case interventionBrowseLeafID = "InterventionBrowseLeafId"
        case interventionBrowseLeafName = "InterventionBrowseLeafName"
        case interventionBrowseLeafAsFound = "InterventionBrowseLeafAsFound"
        case interventionBrowseLeafRelevance = "InterventionBrowseLeafRelevance"
    }
}

enum InterventionBrowseLeafRelevance: String, Codable {
    case high = "high"
    case low = "low"
}

// MARK: - InterventionMeshList
struct InterventionMeshList: Codable {
    let interventionMesh: [InterventionMesh]

    enum CodingKeys: String, CodingKey {
        case interventionMesh = "InterventionMesh"
    }
}

// MARK: - InterventionMesh
struct InterventionMesh: Codable {
    let interventionMeshID, interventionMeshTerm: String

    enum CodingKeys: String, CodingKey {
        case interventionMeshID = "InterventionMeshId"
        case interventionMeshTerm = "InterventionMeshTerm"
    }
}

// MARK: - MiscInfoModule
struct MiscInfoModule: Codable {
    let versionHolder: String

    enum CodingKeys: String, CodingKey {
        case versionHolder = "VersionHolder"
    }
}

// MARK: - ProtocolSection
struct ProtocolSection: Codable {
    let identificationModule: IdentificationModule
    let statusModule: StatusModule
    let sponsorCollaboratorsModule: SponsorCollaboratorsModule
    let oversightModule: OversightModule
    let descriptionModule: DescriptionModule
    let conditionsModule: ConditionsModule
    let designModule: DesignModule
    let armsInterventionsModule: ArmsInterventionsModule
    let outcomesModule: OutcomesModule
    let eligibilityModule: EligibilityModule
    let contactsLocationsModule: ContactsLocationsModule

    enum CodingKeys: String, CodingKey {
        case identificationModule = "IdentificationModule"
        case statusModule = "StatusModule"
        case sponsorCollaboratorsModule = "SponsorCollaboratorsModule"
        case oversightModule = "OversightModule"
        case descriptionModule = "DescriptionModule"
        case conditionsModule = "ConditionsModule"
        case designModule = "DesignModule"
        case armsInterventionsModule = "ArmsInterventionsModule"
        case outcomesModule = "OutcomesModule"
        case eligibilityModule = "EligibilityModule"
        case contactsLocationsModule = "ContactsLocationsModule"
    }
}

// MARK: - ArmsInterventionsModule
struct ArmsInterventionsModule: Codable {
    let armGroupList: ArmGroupList
    let interventionList: InterventionList

    enum CodingKeys: String, CodingKey {
        case armGroupList = "ArmGroupList"
        case interventionList = "InterventionList"
    }
}

// MARK: - ArmGroupList
struct ArmGroupList: Codable {
    let armGroup: [ArmGroup]

    enum CodingKeys: String, CodingKey {
        case armGroup = "ArmGroup"
    }
}

// MARK: - ArmGroup
struct ArmGroup: Codable {
    let armGroupLabel, armGroupType, armGroupDescription: String
    let armGroupInterventionList: ArmGroupInterventionList

    enum CodingKeys: String, CodingKey {
        case armGroupLabel = "ArmGroupLabel"
        case armGroupType = "ArmGroupType"
        case armGroupDescription = "ArmGroupDescription"
        case armGroupInterventionList = "ArmGroupInterventionList"
    }
}

// MARK: - ArmGroupInterventionList
struct ArmGroupInterventionList: Codable {
    let armGroupInterventionName: [String]

    enum CodingKeys: String, CodingKey {
        case armGroupInterventionName = "ArmGroupInterventionName"
    }
}

// MARK: - InterventionList
struct InterventionList: Codable {
    let intervention: [Intervention]

    enum CodingKeys: String, CodingKey {
        case intervention = "Intervention"
    }
}

// MARK: - Intervention
struct Intervention: Codable {
    let interventionType, interventionName, interventionDescription: String
    let interventionArmGroupLabelList: InterventionArmGroupLabelList

    enum CodingKeys: String, CodingKey {
        case interventionType = "InterventionType"
        case interventionName = "InterventionName"
        case interventionDescription = "InterventionDescription"
        case interventionArmGroupLabelList = "InterventionArmGroupLabelList"
    }
}

// MARK: - InterventionArmGroupLabelList
struct InterventionArmGroupLabelList: Codable {
    let interventionArmGroupLabel: [String]

    enum CodingKeys: String, CodingKey {
        case interventionArmGroupLabel = "InterventionArmGroupLabel"
    }
}

// MARK: - ConditionsModule
struct ConditionsModule: Codable {
    let conditionList: ConditionList

    enum CodingKeys: String, CodingKey {
        case conditionList = "ConditionList"
    }
}

// MARK: - ConditionList
struct ConditionList: Codable {
    let condition: [String]

    enum CodingKeys: String, CodingKey {
        case condition = "Condition"
    }
}

// MARK: - ContactsLocationsModule
struct ContactsLocationsModule: Codable {
    let overallOfficialList: OverallOfficialList
    let locationList: LocationList

    enum CodingKeys: String, CodingKey {
        case overallOfficialList = "OverallOfficialList"
        case locationList = "LocationList"
    }
}

// MARK: - LocationList
struct LocationList: Codable {
    let location: [Location]

    enum CodingKeys: String, CodingKey {
        case location = "Location"
    }
}

// MARK: - Location
struct Location: Codable {
    let locationFacility, locationCity, locationState, locationZip: String
    let locationCountry: String

    enum CodingKeys: String, CodingKey {
        case locationFacility = "LocationFacility"
        case locationCity = "LocationCity"
        case locationState = "LocationState"
        case locationZip = "LocationZip"
        case locationCountry = "LocationCountry"
    }
}

// MARK: - OverallOfficialList
struct OverallOfficialList: Codable {
    let overallOfficial: [OverallOfficial]

    enum CodingKeys: String, CodingKey {
        case overallOfficial = "OverallOfficial"
    }
}

// MARK: - OverallOfficial
struct OverallOfficial: Codable {
    let overallOfficialName, overallOfficialAffiliation, overallOfficialRole: String

    enum CodingKeys: String, CodingKey {
        case overallOfficialName = "OverallOfficialName"
        case overallOfficialAffiliation = "OverallOfficialAffiliation"
        case overallOfficialRole = "OverallOfficialRole"
    }
}

// MARK: - DescriptionModule
struct DescriptionModule: Codable {
    let briefSummary: String

    enum CodingKeys: String, CodingKey {
        case briefSummary = "BriefSummary"
    }
}

// MARK: - DesignModule
struct DesignModule: Codable {
    let studyType: String
    let phaseList: PhaseList
    let designInfo: DesignInfo
    let enrollmentInfo: EnrollmentInfo

    enum CodingKeys: String, CodingKey {
        case studyType = "StudyType"
        case phaseList = "PhaseList"
        case designInfo = "DesignInfo"
        case enrollmentInfo = "EnrollmentInfo"
    }
}

// MARK: - DesignInfo
struct DesignInfo: Codable {
    let designAllocation, designInterventionModel, designPrimaryPurpose: String
    let designMaskingInfo: DesignMaskingInfo

    enum CodingKeys: String, CodingKey {
        case designAllocation = "DesignAllocation"
        case designInterventionModel = "DesignInterventionModel"
        case designPrimaryPurpose = "DesignPrimaryPurpose"
        case designMaskingInfo = "DesignMaskingInfo"
    }
}

// MARK: - DesignMaskingInfo
struct DesignMaskingInfo: Codable {
    let designMasking: String

    enum CodingKeys: String, CodingKey {
        case designMasking = "DesignMasking"
    }
}

// MARK: - EnrollmentInfo
struct EnrollmentInfo: Codable {
    let enrollmentCount, enrollmentType: String

    enum CodingKeys: String, CodingKey {
        case enrollmentCount = "EnrollmentCount"
        case enrollmentType = "EnrollmentType"
    }
}

// MARK: - PhaseList
struct PhaseList: Codable {
    let phase: [String]

    enum CodingKeys: String, CodingKey {
        case phase = "Phase"
    }
}

// MARK: - EligibilityModule
struct EligibilityModule: Codable {
    let eligibilityCriteria, healthyVolunteers, gender, minimumAge: String
    let maximumAge: String
    let stdAgeList: StdAgeList

    enum CodingKeys: String, CodingKey {
        case eligibilityCriteria = "EligibilityCriteria"
        case healthyVolunteers = "HealthyVolunteers"
        case gender = "Gender"
        case minimumAge = "MinimumAge"
        case maximumAge = "MaximumAge"
        case stdAgeList = "StdAgeList"
    }
}

// MARK: - StdAgeList
struct StdAgeList: Codable {
    let stdAge: [String]

    enum CodingKeys: String, CodingKey {
        case stdAge = "StdAge"
    }
}

// MARK: - IdentificationModule
struct IdentificationModule: Codable {
    let nctID: String
    let orgStudyIDInfo: OrgStudyIDInfo
    let organization: Organization
    let briefTitle, officialTitle: String

    enum CodingKeys: String, CodingKey {
        case nctID = "NCTId"
        case orgStudyIDInfo = "OrgStudyIdInfo"
        case organization = "Organization"
        case briefTitle = "BriefTitle"
        case officialTitle = "OfficialTitle"
    }
}

// MARK: - OrgStudyIDInfo
struct OrgStudyIDInfo: Codable {
    let orgStudyID: String

    enum CodingKeys: String, CodingKey {
        case orgStudyID = "OrgStudyId"
    }
}

// MARK: - Organization
struct Organization: Codable {
    let orgFullName, orgClass: String

    enum CodingKeys: String, CodingKey {
        case orgFullName = "OrgFullName"
        case orgClass = "OrgClass"
    }
}

// MARK: - OutcomesModule
struct OutcomesModule: Codable {
    let primaryOutcomeList: PrimaryOutcomeList

    enum CodingKeys: String, CodingKey {
        case primaryOutcomeList = "PrimaryOutcomeList"
    }
}

// MARK: - PrimaryOutcomeList
struct PrimaryOutcomeList: Codable {
    let primaryOutcome: [PrimaryOutcome]

    enum CodingKeys: String, CodingKey {
        case primaryOutcome = "PrimaryOutcome"
    }
}

// MARK: - PrimaryOutcome
struct PrimaryOutcome: Codable {
    let primaryOutcomeMeasure, primaryOutcomeDescription, primaryOutcomeTimeFrame: String

    enum CodingKeys: String, CodingKey {
        case primaryOutcomeMeasure = "PrimaryOutcomeMeasure"
        case primaryOutcomeDescription = "PrimaryOutcomeDescription"
        case primaryOutcomeTimeFrame = "PrimaryOutcomeTimeFrame"
    }
}

// MARK: - OversightModule
struct OversightModule: Codable {
    let isFDARegulatedDrug, isFDARegulatedDevice: String

    enum CodingKeys: String, CodingKey {
        case isFDARegulatedDrug = "IsFDARegulatedDrug"
        case isFDARegulatedDevice = "IsFDARegulatedDevice"
    }
}

// MARK: - SponsorCollaboratorsModule
struct SponsorCollaboratorsModule: Codable {
    let responsibleParty: ResponsibleParty
    let leadSponsor: LeadSponsor

    enum CodingKeys: String, CodingKey {
        case responsibleParty = "ResponsibleParty"
        case leadSponsor = "LeadSponsor"
    }
}

// MARK: - LeadSponsor
struct LeadSponsor: Codable {
    let leadSponsorName, leadSponsorClass: String

    enum CodingKeys: String, CodingKey {
        case leadSponsorName = "LeadSponsorName"
        case leadSponsorClass = "LeadSponsorClass"
    }
}

// MARK: - ResponsibleParty
struct ResponsibleParty: Codable {
    let responsiblePartyType: String

    enum CodingKeys: String, CodingKey {
        case responsiblePartyType = "ResponsiblePartyType"
    }
}

// MARK: - StatusModule
struct StatusModule: Codable {
    let statusVerifiedDate, overallStatus: String
    let expandedAccessInfo: ExpandedAccessInfo
    let startDateStruct: StartDateStruct
    let primaryCompletionDateStruct: PrimaryCompletionDateStruct
    let completionDateStruct: CompletionDateStruct
    let studyFirstSubmitDate, studyFirstSubmitQCDate: String
    let studyFirstPostDateStruct: StudyFirstPostDateStruct
    let lastUpdateSubmitDate: String
    let lastUpdatePostDateStruct: LastUpdatePostDateStruct

    enum CodingKeys: String, CodingKey {
        case statusVerifiedDate = "StatusVerifiedDate"
        case overallStatus = "OverallStatus"
        case expandedAccessInfo = "ExpandedAccessInfo"
        case startDateStruct = "StartDateStruct"
        case primaryCompletionDateStruct = "PrimaryCompletionDateStruct"
        case completionDateStruct = "CompletionDateStruct"
        case studyFirstSubmitDate = "StudyFirstSubmitDate"
        case studyFirstSubmitQCDate = "StudyFirstSubmitQCDate"
        case studyFirstPostDateStruct = "StudyFirstPostDateStruct"
        case lastUpdateSubmitDate = "LastUpdateSubmitDate"
        case lastUpdatePostDateStruct = "LastUpdatePostDateStruct"
    }
}

// MARK: - CompletionDateStruct
struct CompletionDateStruct: Codable {
    let completionDate, completionDateType: String

    enum CodingKeys: String, CodingKey {
        case completionDate = "CompletionDate"
        case completionDateType = "CompletionDateType"
    }
}

// MARK: - ExpandedAccessInfo
struct ExpandedAccessInfo: Codable {
    let hasExpandedAccess: String

    enum CodingKeys: String, CodingKey {
        case hasExpandedAccess = "HasExpandedAccess"
    }
}

// MARK: - LastUpdatePostDateStruct
struct LastUpdatePostDateStruct: Codable {
    let lastUpdatePostDate, lastUpdatePostDateType: String

    enum CodingKeys: String, CodingKey {
        case lastUpdatePostDate = "LastUpdatePostDate"
        case lastUpdatePostDateType = "LastUpdatePostDateType"
    }
}

// MARK: - PrimaryCompletionDateStruct
struct PrimaryCompletionDateStruct: Codable {
    let primaryCompletionDate, primaryCompletionDateType: String

    enum CodingKeys: String, CodingKey {
        case primaryCompletionDate = "PrimaryCompletionDate"
        case primaryCompletionDateType = "PrimaryCompletionDateType"
    }
}

// MARK: - StartDateStruct
struct StartDateStruct: Codable {
    let startDate, startDateType: String

    enum CodingKeys: String, CodingKey {
        case startDate = "StartDate"
        case startDateType = "StartDateType"
    }
}

// MARK: - StudyFirstPostDateStruct
struct StudyFirstPostDateStruct: Codable {
    let studyFirstPostDate, studyFirstPostDateType: String

    enum CodingKeys: String, CodingKey {
        case studyFirstPostDate = "StudyFirstPostDate"
        case studyFirstPostDateType = "StudyFirstPostDateType"
    }
}
