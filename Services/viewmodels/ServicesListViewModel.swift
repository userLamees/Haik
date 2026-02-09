import Foundation
import Combine   

@MainActor
final class ServiceListViewModel: ObservableObject {

    // MARK: - Inputs
    let service: ServiceCategory
    let places: [Place]

    // MARK: - UI State
    @Published var selectedPlace: Place? = nil

    // MARK: - Derived
    var title: String { service.rawValue }

    init(service: ServiceCategory, places: [Place]) {
        self.service = service
        self.places = places
    }
}
