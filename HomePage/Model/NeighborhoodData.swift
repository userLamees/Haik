//
//  NeighborhoodData.swift
//  Haik
//
//  Created by lamess on 08/02/2026.
//
import Foundation
import CoreLocation

struct Neighborhood: Identifiable {
    let id = UUID()
    let name: String
    let region: String
    let coordinate: CLLocationCoordinate2D
    let rating: String
    
    let reviewCount: String = "29"
}

struct NeighborhoodData {
    static let all: [Neighborhood] = [

        // --- أحياء مشهورة ---
        Neighborhood(name: "حطين", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.75884, longitude: 46.59859), rating: "4.9"),
        Neighborhood(name: "الملقا", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.80261, longitude: 46.60442), rating: "4.8"),
        Neighborhood(name: "الياسمين", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.82990, longitude: 46.64772), rating: "4.7"),
        Neighborhood(name: "النرجس", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.86478, longitude: 46.65719), rating: "4.6"),
        Neighborhood(name: "العليا", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.6959, longitude: 46.6821), rating: "4.9"),
        Neighborhood(name: "الصحافة", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.80825, longitude: 46.63913), rating: "4.7"),
        Neighborhood(name: "العقيق", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.78210, longitude: 46.62450), rating: "4.8"),
        Neighborhood(name: "الغدير", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.77408, longitude: 46.65475), rating: "4.8"),
        Neighborhood(name: "النخيل", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.74085, longitude: 46.61282), rating: "4.9"),
        Neighborhood(name: "حي السفارات", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.6764, longitude: 46.6251), rating: "5.0"),

        // --- أحياء خدمية قوية ---
        Neighborhood(name: "الملز", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.6676, longitude: 46.7377), rating: "4.5"),
        Neighborhood(name: "السليمانية", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.7076, longitude: 46.6947), rating: "4.7"),
        Neighborhood(name: "الورود", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.7237, longitude: 46.6734), rating: "4.6"),
        Neighborhood(name: "الفلاح", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.7901, longitude: 46.7034), rating: "4.6"),
        //Neighborhood(name: "الملك سلمان", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.7533, longitude: 46.7107), rating: "4.8"),
        Neighborhood(name: "قرطبة", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.81657, longitude: 46.73199), rating: "4.5"),
        Neighborhood(name: "المونسية", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.83223, longitude: 46.76493), rating: "4.6"),
        Neighborhood(name: "الروضة", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.73150, longitude:  46.76566), rating: "4.4"),
        Neighborhood(name: "النسيم الغربي", region: "شرق", coordinate: CLLocationCoordinate2D(latitude:24.72775, longitude: 46.81954), rating: "4.1"),
        Neighborhood(name: "المنار", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.72418, longitude: 46.79719), rating: "4.2"),
        
        // --- جنوب وغرب (خدمات عالية) ---
        Neighborhood(name: "الشفاء", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.56464, longitude: 46.69847), rating: "4.0"),
        Neighborhood(name: "العزيزية", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.59057, longitude: 46.76914), rating: "3.7"),
        Neighborhood(name: "الدار البيضاء", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.56327, longitude: 46.79160), rating: "3.8"),
        Neighborhood(name: "المنصورة", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.61049, longitude: 46.74429), rating: "4.1"),
        Neighborhood(name: "بدر", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.54281, longitude: 46.71592), rating: "3.9"),
        Neighborhood(name: "العريجاء", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.6216, longitude: 46.6094), rating: "4.1"),
        Neighborhood(name: "طويق", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.5924, longitude: 46.5286), rating: "4.2"),
        Neighborhood(name: "ظهرة لبن", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.6491, longitude: 46.5387), rating: "4.0"),
        Neighborhood(name: "لبن", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.6374, longitude: 46.5511), rating: "3.9"),
        Neighborhood(name: "المحمدية", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.7326, longitude: 46.6532), rating: "4.8"),

        // --- أحياء صاعدة / اكتشاف ---
        Neighborhood(name: "القيروان", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.83542, longitude: 46.58786), rating: "4.5"),
        Neighborhood(name: "العارض", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.88708, longitude:  46.61642), rating: "4.2"),
        Neighborhood(name: "الرمال", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.87289, longitude: 46.81490), rating: "4.3"),
        Neighborhood(name: "المهدية", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.7042, longitude: 46.4987), rating: "4.1"),
        Neighborhood(name: "الندى", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.80569, longitude: 46.68450), rating: "4.4"),
        Neighborhood(name: "التعاون", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.77192, longitude: 46.69880), rating: "4.3"),
        Neighborhood(name: "النفل", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.78309, longitude: 46.67404), rating: "4.4"),
        Neighborhood(name: "إشبيلية", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.79144, longitude: 46.78808), rating: "4.2"),
        Neighborhood(name: "النهضة", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.75823, longitude: 46.81410), rating: "4.3"),
        Neighborhood(name: "المروة", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.53790, longitude: 46.67265), rating: "3.8")
    ]
}


