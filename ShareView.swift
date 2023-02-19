//
//  ShareView.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/19/23.
//

import SwiftUI



struct ShareView: UIViewControllerRepresentable {
    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
    }
}

//
//struct ShareView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShareView()
//    }
//}
