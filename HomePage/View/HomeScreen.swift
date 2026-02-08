//
//  HomeScreen.swift
//  Haik
//
//  Created by lamess on 07/02/2026.
//


import SwiftUI
import MapKit

import SwiftUI
import MapKit

struct Neighborhood: Identifiable {
    let id = UUID()
    let name: String
    let rating: String
    let coordinate: CLLocationCoordinate2D
}

struct HomeScreen: View {

    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 24.8100, longitude: 46.6600),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    @State private var selectedNeighborhood: Neighborhood? = nil
    
    let neighborhoods = [
        Neighborhood(name: "حي الياسمين", rating: "4.8", coordinate: CLLocationCoordinate2D(latitude: 24.8296, longitude: 46.6435)),
        Neighborhood(name: "حي الملقا", rating: "4.9", coordinate: CLLocationCoordinate2D(latitude: 24.8250, longitude: 46.6150)),
        Neighborhood(name: "حي الصحافة", rating: "4.7", coordinate: CLLocationCoordinate2D(latitude: 24.8080, longitude: 46.6350)),
        Neighborhood(name: "حي العقيق", rating: "4.6", coordinate: CLLocationCoordinate2D(latitude: 24.7850, longitude: 46.6300)),
        Neighborhood(name: "حي النرجس", rating: "4.4", coordinate: CLLocationCoordinate2D(latitude: 24.8450, longitude: 46.6750)),
        Neighborhood(name: "حي قرطبة", rating: "4.5", coordinate: CLLocationCoordinate2D(latitude: 24.8100, longitude: 46.7330)),
        Neighborhood(name: "حي الفلاح", rating: "4.2", coordinate: CLLocationCoordinate2D(latitude: 24.8050, longitude: 46.6950))
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(position: $position) {
                ForEach(neighborhoods) { neighborhood in
                    Annotation("", coordinate: neighborhood.coordinate) {
                        Button {
                            withAnimation(.spring()) {
                                selectedNeighborhood = neighborhood
                            }
                        } label: {
//
                            VStack(spacing: 0) {
                                Text(neighborhood.rating)
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: 40, height: 30)
                                    .background(Color(red: 0.35, green: 0.65, blue: 0.85))
                                    .cornerRadius(8)
                                    .shadow(radius: 2)
                                
                                Text(neighborhood.name.replacingOccurrences(of: "حي ", with: ""))
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.black)
                                    .padding(.top, 4)
                            }
                        }
                    }
                }
            }
            .mapStyle(.standard(pointsOfInterest: .all)) // لإظهار معالم الحي
            
            //tool bar
            searchBarOverlay
            
            //card info
            if let neighborhood = selectedNeighborhood {
                infoCard(for: neighborhood)
            } else {
                defaultHintCard
            }
        }
        .ignoresSafeArea()
    }
    
    // MARK: - Subviews
    
    private var searchBarOverlay: some View {
        VStack {
            HStack(spacing: 12) {
                CircleButton(icon: "sparkles")
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    Text("الياسمين")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "mic.fill")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 15)
                .frame(height: 50)
                .background(Color.white.opacity(0.95))
                .cornerRadius(25)
                .shadow(color: .black.opacity(0.1), radius: 5)
                
                CircleButton(icon: "bookmark")
            }
            .padding(.horizontal)
            .padding(.top, 60)
            Spacer()
        }
    }
    
    private func infoCard(for neighborhood: Neighborhood) -> some View {
        VStack(alignment: .trailing, spacing: 15) {
            HStack {
                Spacer()
                Text(neighborhood.name)
                    .font(.system(size: 22, weight: .bold))
            }
            
            HStack(spacing: 4) {
                Text("(29)")
                    .font(.caption)
                    .foregroundColor(.gray)
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 14))
                }
            }
            
            Button(action: {}) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("لمزيد من المعلومات عن الحي")
                }
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
            }
            .padding(.top, 5)
        }
        .padding(25)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(color: .black.opacity(0.15), radius: 15)
        .padding()
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }
    
    private var defaultHintCard: some View {
        Text("لسه ما عرفت عن الأحياء؟ اضغط على الحي وبتعرف عن الخدمات أكثر")
            .font(.system(size: 14))
            .multilineTextAlignment(.center)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding()
            .padding(.bottom, 20)
    }
}

struct CircleButton: View {
    let icon: String
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 18))
            .frame(width: 45, height: 45)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.1), radius: 5)
    }
}
#Preview {
    HomeScreen()
    
}
