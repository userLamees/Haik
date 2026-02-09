import SwiftUI

struct NeighborhoodServicesView: View {

    // MARK: - Assets (match your Assets names)
    private let greenPrimary = Color("GreenPrimary")
    private let pageBackground = Color("PageBackground")
    private let borderGray = Color(hex: "DBDBDB")
    private let hintGray = Color(hex: "ACACAC")
    private let yellowHex = Color(hex: "E7CB62") // yellow not in Assets

    // MARK: - Dummy data (for preview only)
    private let neighborhoodName: String = "حي تجريبي"

    // Services (dummy – you can keep your ServiceCategory enum if you already have it)
    private let services: [ServiceCategory] = ServiceCategory.allCases

    // Reviews (dummy)
    @State private var selectedCategory: ReviewCategory = .electricity
    @State private var newRating: Int = 0
    @State private var newComment: String = ""

    @State private var reviews: [NeighborhoodReview] = [
        NeighborhoodReview(category: .electricity, rating: 3, comment: "جيده جدا! لايوجد انقطاعات.", createdAt: Date().addingTimeInterval(-2 * 24 * 3600)),
        NeighborhoodReview(category: .internet, rating: 4, comment: "النت ممتاز أغلب الوقت.", createdAt: Date().addingTimeInterval(-6 * 24 * 3600))
    ]

    // Grid layout (you said you will resend it — currently matches your 3 columns look)
    private let grid = [
        GridItem(.flexible(), spacing: 22),
        GridItem(.flexible(), spacing: 22),
        GridItem(.flexible(), spacing: 22)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 18) {

                    header

                    // MARK: - Services title
                    Text("الخدمات")
                        .font(.system(size: 22, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 24)
                        .padding(.top, 4)

                    servicesGrid

                    // MARK: - Reviews title
                    Text("التقييمات والتعليقات")
                        .font(.system(size: 22, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 18)

                    // MARK: - Review type label
                    Text("نوع التعليق")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(hintGray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 24)

                    chipsRow

                    reviewInputBox

                    // MARK: - Comments section title (gray 17)
                    Text("التعليقات")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(hintGray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 24)
                        .padding(.top, 10)

                    commentsList
                }
                .padding(.bottom, 30)
            }
            .background(pageBackground.ignoresSafeArea())
        }
        .environment(\.layoutDirection, .rightToLeft)
    }

    // MARK: - Header (Save right, Title center, Back left)
    private var header: some View {
        HStack {
            // In RTL: first item shows on the RIGHT
            Button { } label: {
                Image(systemName: "bookmark")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(.black)
                    .frame(width: 52, height: 52)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.12), radius: 12, x: 0, y: 8)
            }

            Spacer()

            Text(neighborhoodName)
                .font(.system(size: 34, weight: .regular)) // SF Pro regular 34
                .foregroundStyle(.black)

            Spacer()

            Button { } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(greenPrimary)
                    .frame(width: 52, height: 52)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.12), radius: 12, x: 0, y: 8)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }

    // MARK: - Services Grid
    private var servicesGrid: some View {
        LazyVGrid(columns: grid, spacing: 22) {
            ForEach(services) { service in
                NavigationLink {
                    // Dummy destination for now
                    Text(service.rawValue)
                        .font(.system(size: 28, weight: .regular))
                } label: {
                    serviceTile(service)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 6)
    }

    private func serviceTile(_ service: ServiceCategory) -> some View {
        VStack(spacing: 10) {

            // If SF Symbol needed (example: fuelpump)
            if let fallback = service.fallbackSystemSymbol {
                Image(systemName: fallback)
                    .font(.system(size: 34, weight: .regular))
                    .foregroundStyle(service.iconColor(using: greenPrimary, yellowHex: yellowHex))
            } else {
                Image(systemName: service.icon.systemName)
                    .font(.system(size: 34, weight: .regular))
                    .foregroundStyle(service.iconColor(using: greenPrimary, yellowHex: yellowHex))
            }

            Text(service.rawValue)
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(Color.gray.opacity(0.75))
        }
        .frame(width: 108, height: 108) // close to your tile
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.10), radius: 12, x: 0, y: 10)
    }

    // MARK: - Chips Row
    private var chipsRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(ReviewCategory.allCases) { cat in
                    Text(cat.rawValue)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(selectedCategory == cat ? Color.white : greenPrimary)
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(selectedCategory == cat ? greenPrimary : Color.white)
                        .overlay(
                            Capsule().stroke(borderGray, lineWidth: 1)
                        )
                        .clipShape(Capsule())
                        .onTapGesture { selectedCategory = cat }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 4)
            .padding(.bottom, 6)
        }
    }

    // MARK: - Review Input Box (355 x 146)
    private var reviewInputBox: some View {
        ZStack(alignment: .topTrailing) {

            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(borderGray, lineWidth: 1)
                )
                .frame(width: 355, height: 146)

            // Placeholder top-right (size 17, gray like "نوع التعليق")
            if newComment.isEmpty {
                Text("اكتب تعليقك...")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(hintGray)
                    .padding(.top, 16)
                    .padding(.trailing, 18)
            }

            // Stars top-left inside box (start empty)
            HStack(spacing: 8) {
                ForEach(1...5, id: \.self) { i in
                    Image(systemName: "star.fill")
                        .font(.system(size: 22, weight: .regular))
                        .foregroundStyle(i <= newRating ? Color.yellow : Color.gray.opacity(0.35))
                        .onTapGesture { newRating = i }
                }
                Spacer()
            }
            .padding(.top, 16)
            .padding(.leading, 18)
            .frame(width: 355)

            // TextEditor layer
            TextEditor(text: $newComment)
                .font(.system(size: 16, weight: .regular))
                .padding(.horizontal, 14)
                .padding(.top, 44) // below stars
                .frame(width: 355, height: 146)
                .scrollContentBackground(.hidden)
                .background(Color.clear)

            // Plus button bottom-left inside box
            VStack {
                Spacer()
                HStack {
                    Button {
                        addReview()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 52, height: 52)
                            .background(greenPrimary)
                            .clipShape(Circle())
                    }
                    .padding(.leading, 14)
                    .padding(.bottom, 14)

                    Spacer()
                }
            }
            .frame(width: 355, height: 146)
        }
        .padding(.top, 6)
    }

    // MARK: - Comments list
    private var commentsList: some View {
        VStack(spacing: 14) {
            ForEach(reviews) { r in
                commentCard(r)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 4)
    }

    private func commentCard(_ review: NeighborhoodReview) -> some View {
        VStack(alignment: .leading, spacing: 10) {

            HStack {
                // Stars left
                HStack(spacing: 6) {
                    ForEach(1...5, id: \.self) { i in
                        Image(systemName: "star.fill")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(i <= review.rating ? Color.yellow : Color.gray.opacity(0.35))
                    }
                }

                Spacer()

                // Category pill TOP RIGHT (same size/style as chips)
                Text(review.category.rawValue)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(Color.white)
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 10)
                    .background(greenPrimary)
                    .overlay(Capsule().stroke(borderGray, lineWidth: 1))
                    .clipShape(Capsule())
            }

            Text(review.comment)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.black)

            Text(relativeDate(review.createdAt))
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(hintGray)
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 8)
    }

    // MARK: - Actions
    private func addReview() {
        let trimmed = newComment.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        guard (1...5).contains(newRating) else { return }

        reviews.insert(
            NeighborhoodReview(category: selectedCategory, rating: newRating, comment: trimmed),
            at: 0
        )

        // reset (empty like your UX)
        newComment = ""
        newRating = 0
        selectedCategory = .electricity
    }

    private func relativeDate(_ date: Date) -> String {
        let f = RelativeDateTimeFormatter()
        f.locale = Locale(identifier: "ar")
        return f.localizedString(for: date, relativeTo: Date())
    }
}

// MARK: - Helpers
private extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 6: (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default: (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}

// MARK: - If you already have ServiceCategory, just add this helper as extension:
private extension ServiceCategory {
    func iconColor(using greenPrimary: Color, yellowHex: Color) -> Color {
        // Match your design palette by service group
        switch self {
        case .parks, .libraries, .gasStations, .groceries:
            return greenPrimary
        case .metro, .hospitals:
            return Color("BlueSecondary")
        case .cafes, .universities, .supermarkets:
            return Color("PurpleSecondary")
        case .cinema, .restaurants, .schools:
            return yellowHex
        }
    }
}

// MARK: - Preview
#Preview {
    NeighborhoodServicesView()
}
