//
//  StudyRowItemView.swift
//  TrialrApp
//
//  Created by Ocean on 2/16/23.
//

import SwiftUI

struct StudyRowItemView: View {
    let study: StudyField
    let isSaved: Bool

    var body: some View {
        NavigationLink {
            StudyDetailsView()
        } label: {
            VStack(alignment: .leading, spacing: 4) {
                Text(study.briefTitle.first ?? "")
                    .font(.headline)
                    .lineLimit(5)
                Text(study.condition.first ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                Text(study.locationFacility.first ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                HStack {
                    Image(systemName: isSaved ? "heart.fill" : "heart")
                        .foregroundColor(isSaved ? .red : .gray)
                        .imageScale(.large)
                }
            }
        }
    }
}


//struct StudyRowItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudyRowItemView()
//    }
//}


