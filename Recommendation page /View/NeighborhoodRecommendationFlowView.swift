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
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            withAnimation(.easeInOut(duration: 0.18)) {
                                vm.goBack()
                            }
                        } label: {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .frame(width: 44, height: 44)
                                .background(Color.white.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .opacity(vm.currentIndex > 0 ? 1 : 0)
                        .disabled(vm.currentIndex == 0)          
                    }
                }
        }
    }
}
