//
//  StudyRowItemView.swift
//  TrialrApp
//
//  Created by Ocean on 2/16/23.
//

import SwiftUI

struct StudyRowItemView: View {
    let study: StudyField
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(study.briefTitle.first ?? "")
                .font(.headline)
                .lineLimit(1)
            Text(study.condition.first ?? "")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)
            Text(study.locationFacility.first ?? "")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)
            HStack {
                Image(systemName: "heart")
                    .foregroundColor(.red)
                    .imageScale(.large)
            }
        }
        
    }
}

//struct StudyRowItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudyRowItemView()
//    }
//}


