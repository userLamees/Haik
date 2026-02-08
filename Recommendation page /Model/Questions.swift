//
//  Questions.swift
//  Haik
//
//  Created by Shahad Alharbi on 2/8/26.
//

import Foundation
import SwiftUI

struct Questions: Identifiable, Hashable {
    let id: String
    let title: String
    let options: [RecommendationOption]
}

struct RecommendationOption: Identifiable, Hashable {
    let id: String
    let title: String
    let icon: HaikIcon
}

enum HaikIcon: String, Hashable {
    case calm = "leaf"
    case active = "fireworks"
    case fullServices = "cart"

    case nearWork = "briefcase"
    case nearFamily = "house"
    case services = "basket"
    case schools = "pencil.and.ruler"
    case universities = "graduationcap"
    case entertainment = "popcorn"

    case metroPrimary = "tram"
    case metroSometimes = "tram.card"
    case car = "car"

    var systemName: String { rawValue }

    var font: Font { .system(size: DS.iconSize, weight: DS.iconWeight) }

    var color: Color { DS.iconColor }
}
