//
//  ServiceEnums.swift
//  Haik
//
//  Created by layan Alturki on 09/02/2026.
//

import Foundation

// MARK: - Service Categories (fixed for all neighborhoods)
enum ServiceCategory: String, CaseIterable, Identifiable {
    case hospitals = "مستشفيات"
    case groceries = "تموينات"
    case schools = "مدارس"
    case gasStations = "محطات بنزين"
    case cinema = "السينما"
    case cafes = "مقاهي"
    case restaurants = "المطاعم"
    case supermarkets = "سوبرماركت"
    case universities = "جامعات"
    case parks = "الحدائق"
    case libraries = "المكتبات"
    case metro = "مترو"

    var id: String { rawValue }

    // Uses your existing HaikIcon enum (NO redeclaration)
    var icon: HaikIcon {
        switch self {
        case .parks: return .calm
        case .cinema: return .entertainment
        case .schools: return .schools
        case .universities: return .universities
        case .metro: return .metroPrimary
        case .groceries, .supermarkets: return .fullServices
        default: return .services
        }
    }

    // Icon colors from your HEX codes
    var iconHexColor: String {
        switch self {
        case .restaurants: return "E7CB62"     // yellow
        case .cinema: return "E7CB62"         // yellow
        case .cafes: return "673AB7"          // purple
        case .universities: return "673AB7"   // purple
        case .metro: return "57AFDD"          // blue
        case .hospitals: return "57AFDD"      // blue
        case .parks: return "0D896E"          // green
        case .libraries: return "0D896E"      // green
        case .schools: return "E7CB62"        // yellow
        case .gasStations: return "0D896E"    // green (icon from SF)
        case .groceries: return "0D896E"      // green
        case .supermarkets: return "673AB7"   // purple (basket)
        }
    }

    // If icon not available in your HaikIcon (like gas), use SF Symbol here
    var fallbackSystemSymbol: String? {
        switch self {
        case .gasStations:
            return "fuelpump"
        default:
            return nil
        }
    }
}
