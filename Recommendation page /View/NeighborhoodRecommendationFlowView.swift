//
//  NeighborhoodRecommendationFlowView.swift
//  Haik
//
//  Created by Shahad Alharbi on 2/8/26.
//

import SwiftUI

struct NeighborhoodRecommendationFlowView: View {

    @StateObject private var vm = NeighborhoodRecommendationViewModel()

    var body: some View {
        NavigationStack {
            NeighborhoodQuestionView(vm: vm)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        if vm.currentIndex > 0 {
                            Button {
                                vm.goBack()
                            } label: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}
