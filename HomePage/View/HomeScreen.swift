//
//  HomeScreen.swift
//  Haik
//
//  Created by lamess on 07/02/2026.
//


import SwiftUI
import MapKit

struct Neighborhood: Identifiable {
    let id = UUID()
    let name: String
    let region: String
    let coordinate: CLLocationCoordinate2D
    let rating: String
}

struct HomeScreen: View {

    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 24.8100, longitude: 46.6600),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    @State private var selectedNeighborhood: Neighborhood? = nil
    
    // 3. قائمة الـ 50 حي بإحداثيات دقيقة
        let neighborhoods: [Neighborhood] = [
            // شمال الرياض
            Neighborhood(name: "حي حطين", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.7605, longitude: 46.6022), rating: "4.9"),
            Neighborhood(name: "حي الملقا", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.8250, longitude: 46.6150), rating: "4.8"),
            Neighborhood(name: "حي الياسمين", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.8296, longitude: 46.6435), rating: "4.7"),
            Neighborhood(name: "حي النرجس", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.8450, longitude: 46.6750), rating: "4.3"),
            Neighborhood(name: "حي الصحافة", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.8080, longitude: 46.6350), rating: "4.7"),
            Neighborhood(name: "حي العقيق", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.7850, longitude: 46.6300), rating: "4.6"),
            Neighborhood(name: "حي النخيل", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.7470, longitude: 46.6320), rating: "4.9"),
            Neighborhood(name: "حي القيروان", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.8650, longitude: 46.5850), rating: "4.5"),
            Neighborhood(name: "حي العارض", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.8850, longitude: 46.6350), rating: "4.2"),
            Neighborhood(name: "حي الغدير", region: "شمال", coordinate: CLLocationCoordinate2D(latitude: 24.7700, longitude: 46.6550), rating: "4.8"),
            
            // شرق الرياض
            Neighborhood(name: "حي قرطبة", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.8100, longitude: 46.7330), rating: "4.5"),
            Neighborhood(name: "حي اليرموك", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.8250, longitude: 46.7950), rating: "4.0"),
            Neighborhood(name: "حي المونسية", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.8500, longitude: 46.8150), rating: "4.1"),
            Neighborhood(name: "حي اشبيلية", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.7950, longitude: 46.8000), rating: "4.2"),
            Neighborhood(name: "حي الروضة", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.7200, longitude: 46.7500), rating: "4.4"),
            Neighborhood(name: "حي الريان", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.7000, longitude: 46.7800), rating: "4.3"),
            Neighborhood(name: "حي الشهداء", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.7920, longitude: 46.7300), rating: "4.4"),
            Neighborhood(name: "حي الخليج", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.7700, longitude: 46.8100), rating: "4.1"),
            Neighborhood(name: "حي النهضة", region: "شرق", coordinate: CLLocationCoordinate2D(latitude: 24.7500, longitude: 46.8300), rating: "4.0"),
            
            // وسط الرياض
            Neighborhood(name: "حي العليا", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.6950, longitude: 46.6800), rating: "4.9"),
            Neighborhood(name: "حي السليمانية", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.7050, longitude: 46.6900), rating: "4.7"),
            Neighborhood(name: "حي الورود", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.7250, longitude: 46.6750), rating: "4.6"),
            Neighborhood(name: "حي المربع", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.6550, longitude: 46.7100), rating: "4.2"),
            Neighborhood(name: "حي الملز", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.6650, longitude: 46.7300), rating: "4.3"),
            Neighborhood(name: "حي المعذر", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.6750, longitude: 46.6600), rating: "4.5"),
            Neighborhood(name: "حي صلاح الدين", region: "وسط", coordinate: CLLocationCoordinate2D(latitude: 24.7400, longitude: 46.6950), rating: "4.5"),
            
            // غرب الرياض
            Neighborhood(name: "حي السفارات", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.6750, longitude: 46.6250), rating: "5.0"),
            Neighborhood(name: "حي الرائد", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.7150, longitude: 46.6350), rating: "4.7"),
            Neighborhood(name: "حي المحمدية", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.7350, longitude: 46.6500), rating: "4.8"),
            Neighborhood(name: "حي لبن", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.6350, longitude: 46.5500), rating: "3.9"),
            Neighborhood(name: "حي المهدية", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.6550, longitude: 46.4950), rating: "4.0"),
            Neighborhood(name: "حي طويق", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.6100, longitude: 46.5300), rating: "3.8"),
            Neighborhood(name: "حي نمار", region: "غرب", coordinate: CLLocationCoordinate2D(latitude: 24.5500, longitude: 46.5800), rating: "4.1"),
            
            // جنوب الرياض
            Neighborhood(name: "حي الشفاء", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.5450, longitude: 46.7100), rating: "4.0"),
            Neighborhood(name: "حي العزيزية", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.5850, longitude: 46.7550), rating: "3.7"),
            Neighborhood(name: "حي الدار البيضاء", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.5350, longitude: 46.7850), rating: "3.6"),
            Neighborhood(name: "حي المنصورة", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.6150, longitude: 46.7450), rating: "3.8"),
            Neighborhood(name: "حي الحاير", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.4500, longitude: 46.8200), rating: "3.5"),
            Neighborhood(name: "حي بدر", region: "جنوب", coordinate: CLLocationCoordinate2D(latitude: 24.5200, longitude: 46.7000), rating: "3.9")
        ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(position: $position) {
                ForEach(neighborhoods) { neighborhood in
                    // تصميم الـ Annotation ليكون التقييم فوق الاسم
                    Annotation("", coordinate: neighborhood.coordinate) {
                        Button {
                            withAnimation(.spring()) {
                                selectedNeighborhood = neighborhood
                            }
                        } label: {
                            VStack(spacing: 4) {
                                // فقاعة التقييم الزرقاء
                                Text(neighborhood.rating)
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color(red: 0.35, green: 0.65, blue: 0.85))
                                    )
                                    .shadow(radius: 2)
                                
                                // اسم الحي تحت التقييم
                                Text(neighborhood.name)
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 4)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(4)
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
            
            // الواجهات العلوية والسفلية
            VStack {
                topSearchBar
                Spacer()
                if let neighborhood = selectedNeighborhood {
                    infoCard(neighborhood: neighborhood)
                } else {
                    hintCard
                }
            }
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
    
    // MARK: - Components
    
    private var topSearchBar: some View {
        HStack {
            Image(systemName: "bookmark").padding(10).background(.white).clipShape(Circle()).shadow(radius: 2)
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(.gray)
                Text("ابحث عن حي...").foregroundColor(.gray)
                Spacer()
                Image(systemName: "mic.fill").foregroundColor(.gray)
            }
            .padding(.horizontal)
            .frame(height: 48)
            .background(Color.white).cornerRadius(24).shadow(radius: 2)
            Image(systemName: "sparkles").padding(10).background(.white).clipShape(Circle()).shadow(radius: 2)
        }
        .padding(.horizontal).padding(.top, 60)
    }
    
    private func infoCard(neighborhood: Neighborhood) -> some View {
        VStack(alignment: .trailing, spacing: 10) {
            Text("حي \(neighborhood.name)").font(.title2.bold())
            HStack {
                Text("(29)").font(.caption).foregroundColor(.gray)
                ForEach(0..<5) { _ in Image(systemName: "star.fill").foregroundColor(.yellow).font(.caption) }
            }
            Button(action: {}) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("لمزيد من المعلومات عن الحي")
                }
                .font(.system(size: 14, weight: .medium)).foregroundColor(.black)
            }
        }
        .padding(25).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 25)).shadow(radius: 10).padding()
    }
    
    private var hintCard: some View {
        Text("لسه ما عرفت عن الأحياء؟ اضغط على الحي وبتعرف أكثر")
            .font(.system(size: 14)).padding().background(Color.white).cornerRadius(20).shadow(radius: 5).padding(.bottom, 40)
    }
}
#Preview {
    HomeScreen()
    
}
