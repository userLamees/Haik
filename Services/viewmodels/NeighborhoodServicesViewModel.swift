import Foundation
import Combine

@MainActor
final class NeighborhoodServicesViewModel: ObservableObject {

    // MARK: - Independent input (no Home binding now)
    let neighborhoodName: String

    // MARK: - Services
    let services: [ServiceCategory] = ServiceCategory.allCases

    // MARK: - Reviews
    @Published private(set) var reviews: [NeighborhoodReview] = []

    // MARK: - Form state (start empty like your design)
    @Published var selectedCategory: ReviewCategory = .electricity
    @Published var newRating: Int = 0
    @Published var newComment: String = ""

    // MARK: - Dummy places per service
    private let dummyPlaces: [ServiceCategory: [Place]]

    init(neighborhoodName: String) {
        self.neighborhoodName = neighborhoodName

        // Dummy reviews (for preview UX)
        self.reviews = [
            NeighborhoodReview(category: .electricity, rating: 3, comment: "جيده جدا! لايوجد انقطاعات.", createdAt: Date().addingTimeInterval(-2 * 24 * 3600)),
            NeighborhoodReview(category: .internet, rating: 4, comment: "النت ممتاز أغلب الوقت.", createdAt: Date().addingTimeInterval(-6 * 24 * 3600))
        ]

        // Dummy places (like your parks list)
        self.dummyPlaces = [
            .parks: [
                Place(name: "حديقة \(neighborhoodName) ٦", rating: 3, isOpen: true),
                Place(name: "حديقة \(neighborhoodName) ٧", rating: 4, isOpen: true)
            ],
            .supermarkets: [
                Place(name: "سوبرماركت \(neighborhoodName) ١", rating: 4, isOpen: true),
                Place(name: "سوبرماركت \(neighborhoodName) ٢", rating: 5, isOpen: false)
            ],
            .hospitals: [
                Place(name: "مستشفى \(neighborhoodName) العام", rating: 4, isOpen: true)
            ],
            .cafes: [
                Place(name: "مقهى \(neighborhoodName) ١", rating: 4, isOpen: true),
                Place(name: "مقهى \(neighborhoodName) ٢", rating: 3, isOpen: false)
            ],
            .gasStations: [
                Place(name: "محطة \(neighborhoodName) ١", rating: 4, isOpen: true)
            ],
            .cinema: [
                Place(name: "سينما \(neighborhoodName)", rating: 4, isOpen: true)
            ],
            .schools: [
                Place(name: "مدرسة \(neighborhoodName) ١", rating: 4, isOpen: true)
            ],
            .libraries: [
                Place(name: "مكتبة \(neighborhoodName)", rating: 4, isOpen: true)
            ],
            .metro: [
                Place(name: "مترو \(neighborhoodName)", rating: 4, isOpen: true)
            ],
            .restaurants: [
                Place(name: "مطعم \(neighborhoodName) ١", rating: 5, isOpen: true)
            ],
            .groceries: [
                Place(name: "تموينات \(neighborhoodName)", rating: 4, isOpen: true)
            ],
            .universities: [
                Place(name: "جامعة قريبة من \(neighborhoodName)", rating: 4, isOpen: true)
            ]
        ]
    }

    func places(for service: ServiceCategory) -> [Place] {
        dummyPlaces[service] ?? []
    }

    func addReview() {
        let trimmed = newComment.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        guard (1...5).contains(newRating) else { return }

        let review = NeighborhoodReview(category: selectedCategory, rating: newRating, comment: trimmed)
        reviews.insert(review, at: 0)

        // reset (empty like design)
        newRating = 0
        newComment = ""
        selectedCategory = .electricity
    }
}
