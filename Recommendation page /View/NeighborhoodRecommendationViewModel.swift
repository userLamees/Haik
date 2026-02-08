//
//  NeighborhoodRecommendationViewModel.swift
//  Haik
//
//  Created by Shahad Alharbi on 2/8/26.
//

import SwiftUI
import Combine

@MainActor
final class NeighborhoodRecommendationViewModel: ObservableObject {

    @Published var questions: [Questions] = []
    @Published var currentIndex: Int = 0
    @Published private(set) var answers: [String: String] = [:]

    let totalSteps: Int = 4

    init() {
        questions = Self.buildQuestions()
    }

    var currentQuestion: Questions {
        questions[currentIndex]
    }

    var currentStep: Int {
        currentIndex + 1
    }

    func selectedOptionID(for questionID: String) -> String? {
        answers[questionID]
    }

    func select(option: RecommendationOption, for question: Questions) {
        answers[question.id] = option.id
    }

    func canGoNext() -> Bool {
        answers[currentQuestion.id] != nil
    }

    func goNext() {
        guard currentIndex < questions.count - 1 else { return }
        currentIndex += 1
    }

    func goBack() {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
    }

    private static func buildQuestions() -> [Questions] {
        [
            Questions(
                id: "q1",
                title: "أي نمط حياة تفضل؟",
                options: [
                    RecommendationOption(id: "q1_a", title: "حي هادئ", icon: .calm),
                    RecommendationOption(id: "q1_b", title: "حي نشط وحيوي", icon: .active),
                    RecommendationOption(id: "q1_c", title: "حي متكامل الخدمات", icon: .fullServices)
                ]
            ),

            Questions(
                id: "q2",
                title: "ما الأولوية الأهم لك عند اختيار الحي؟",
                options: [
                    RecommendationOption(id: "q2_a", title: "القرب من مقر العمل", icon: .nearWork),
                    RecommendationOption(id: "q2_b", title: "القرب من منزل العائلة أو الأقارب", icon: .nearFamily),
                    RecommendationOption(id: "q2_c", title: "توفر الخدمات", icon: .services),
                    RecommendationOption(id: "q2_d", title: "توفر المدارس", icon: .schools),
                    RecommendationOption(id: "q2_e", title: "القرب من الجامعات", icon: .universities),
                    RecommendationOption(id: "q2_f", title: "توفر المرافق الترفيهية", icon: .entertainment)
                ]
            ),

            Questions(
                id: "q3",
                title: "كيف تفضل نمط تنقلك اليومي؟",
                options: [
                    RecommendationOption(id: "q3_a", title: "أعتمد على المترو بشكل أساسي", icon: .metroPrimary),
                    RecommendationOption(id: "q3_b", title: "أستخدم المترو أحيانًا", icon: .metroSometimes),
                    RecommendationOption(id: "q3_c", title: "أعتمد على السيارة", icon: .car)
                ]
            )
        ]
    }

}
