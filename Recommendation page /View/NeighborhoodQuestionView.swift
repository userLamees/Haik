//
//  NeighborhoodQuestionView.swift
//  Haik
//
//  Created by Shahad Alharbi on 2/8/26.
//

import SwiftUI

struct NeighborhoodQuestionView: View {

    @ObservedObject var vm: NeighborhoodRecommendationViewModel
    private let sidePadding: CGFloat = 26

    var body: some View {

        let question = vm.currentQuestion
        let selectedID = vm.selectedOptionID(for: question.id)

        VStack(spacing: DS.cardSpacing) {

            DashedProgressBar(total: vm.totalSteps, current: vm.currentStep)
                .padding(.top, 14)
                .padding(.horizontal, sidePadding)


            Text(question.title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.black)
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, sidePadding)

            VStack(spacing: 12) {
                ForEach(question.options) { option in
                    OptionCardButton(
                        title: option.title,
                        icon: option.icon,
                        isSelected: selectedID == option.id,
                        onTap: {
                            vm.select(option: option, for: question)

                            Task {
                                try? await Task.sleep(nanoseconds: 1_000_000_000) 
                                withAnimation(.easeInOut(duration: 0.10)) {
                                    vm.goNext()
                                }
                            }
                        }
                    )
                }
            }
            .padding(.horizontal, sidePadding)
            .padding(.top, 6)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("GreyBackground"))
    }
}
