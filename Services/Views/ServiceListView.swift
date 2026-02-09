import SwiftUI

struct ServiceListView: View {

    // MARK: - Inputs
    let service: ServiceCategory           // ✅ عشان التايتل يتغير حسب الخدمة
    let places: [Place]                    // ✅ الداتا (dummy الحين)

    // MARK: - UI State
    @State private var selectedPlace: Place? = nil

    // MARK: - Assets
    private let pageBackground = Color("PageBackground")
    private let greenPrimary = Color("GreenPrimary")

    // MARK: - Row constants (from your Figma)
    private let rowWidth: CGFloat = 348
    private let rowHeight: CGFloat = 69
    private let rowCorner: CGFloat = 24

    var body: some View {
        ZStack {
            pageBackground.ignoresSafeArea()

            VStack(spacing: 18) {

                header

                VStack(spacing: 18) {
                    ForEach(places) { place in
                        Button {
                            selectedPlace = place
                        } label: {
                            placeRow(place)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.top, 6)

                Spacer()
            }
            .padding(.top, 10)
        }
        .environment(\.layoutDirection, .rightToLeft)
        .navigationBarBackButtonHidden(true)
        .sheet(item: $selectedPlace) { place in
            PlaceDetailSheetView(place: place, service: service)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }

    // MARK: - Header (Title dynamic, 34, black, SF Regular)
    private var header: some View {
        ZStack {
            HStack {
                BackCircleButton(tint: greenPrimary)
                Spacer()
            }

            Text(service.rawValue) // ✅ حدائق / مستشفيات / ...
                .font(.system(size: 34, weight: .regular))
                .foregroundStyle(.black)
        }
        .padding(.horizontal, 22)
    }

    // MARK: - Place Row (348x69, corner 24, NO border, shadow only)
    private func placeRow(_ place: Place) -> some View {
        HStack {

            // ✅ الإشارة (chevron) داخل البوكس مثل تصميمك
            Image(systemName: "chevron.left")
                .font(.system(size: 18, weight: .regular))
                .foregroundStyle(Color.gray.opacity(0.65))
                .padding(.leading, 18)

            Spacer()

            Text(place.name)
                .font(.system(size: 24, weight: .regular))
                .foregroundStyle(.black)

            // ✅ أيقونة الخدمة تتغير حسب الخدمة (حدائق = شجرة، مترو = مترو... إلخ)
            serviceIcon
                .font(.system(size: 34, weight: .regular))
                .foregroundStyle(greenPrimary)
                .padding(.trailing, 18)
        }
        .frame(width: rowWidth, height: rowHeight)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: rowCorner, style: .continuous))
        .shadow(color: .black.opacity(0.14), radius: 12, x: 0, y: 10)
    }

    private var serviceIcon: Image {
        // لو عندك fallback SF Symbol (مثل fuelpump)
        if let fallback = service.fallbackSystemSymbol {
            return Image(systemName: fallback)
        }
        // غير كذا يستخدم HaikIcon اللي عندك
        return Image(systemName: service.icon.systemName)
    }
}

// MARK: - Back button (circle)
private struct BackCircleButton: View {
    @Environment(\.dismiss) private var dismiss
    let tint: Color

    var body: some View {
        Button { dismiss() } label: {
            Image(systemName: "arrow.right") // RTL
                .font(.system(size: 18, weight: .regular))
                .foregroundStyle(tint)
                .frame(width: 56, height: 56)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.12), radius: 12, x: 0, y: 8)
        }
    }
}
