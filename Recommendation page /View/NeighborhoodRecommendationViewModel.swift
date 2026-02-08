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
            // Q1
            Questions(
                id: "q1",
                title: "أي نمط حياة تفضل؟",
                options: [
                    RecommendationOption(id: "q1_a", title: "حي هادئ", sfSymbol: "leaf"),
                    RecommendationOption(id: "q1_b", title: "حي نشط وحيوي", sfSymbol: "sparkles"),
                    RecommendationOption(id: "q1_c", title: "حي متكامل الخدمات", sfSymbol: "cart")
                ]
            ),

            // Q2
            Questions(
                id: "q2",
                title: "ما الأولوية الأهم لك عند اختيار الحي؟",
                options: [
                    RecommendationOption(id: "q2_a", title: "القرب من مقر العمل", sfSymbol: "briefcase"),
                    RecommendationOption(id: "q2_b", title: "القرب من منزل العائلة أو الأقارب", sfSymbol: "house"),
                    RecommendationOption(id: "q2_c", title: "توفر الخدمات", sfSymbol: "basket"),
                    RecommendationOption(id: "q2_d", title: "توفر المدارس", sfSymbol: "book"),
                    RecommendationOption(id: "q2_e", title: "القرب من الجامعات", sfSymbol: "graduationcap"),
                    RecommendationOption(id: "q2_f", title: "توفر المرافق الترفيهية", sfSymbol: "figure.walk")
                ]
            ),

            // Q3
            Questions(
                id: "q3",
                title: "كيف تفضل نمط تنقلك اليومي؟",
                options: [
                    RecommendationOption(id: "q3_a", title: "أعتمد على المترو بشكل أساسي", sfSymbol: "tram"),
                    RecommendationOption(id: "q3_b", title: "أستخدم المترو أحيانًا", sfSymbol: "tram.fill"),
                    RecommendationOption(id: "q3_c", title: "أعتمد على السيارة", sfSymbol: "car")
                ]
            )
        ]
    }
}
