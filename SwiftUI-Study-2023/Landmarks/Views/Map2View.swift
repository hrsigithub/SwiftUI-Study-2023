//
//  Map2View.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2024/02/15.
//

import SwiftUI
import MapKit

struct Point: Identifiable {
    let id = UUID()
    let latitude: Double // 緯度
    let longitude: Double // 経度
    
    // 座標
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}


struct Map2View: View {
    
    @State var pointList = [
        Point(latitude: 34.49172929146284, longitude: 135.80335844842276),
    ]
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.49183610307475, longitude: 135.8021037864102), latitudinalMeters:1000.0, longitudinalMeters: 1000.0)
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    
    var body: some View {
        
        Map(coordinateRegion: $region,
            annotationItems: pointList,
            annotationContent: { point in MapAnnotation(coordinate: point.coordinate,
                                                        anchorPoint: CGPoint(x: 1, y: 1), // ポイントからのアノテーションの表示位置を調整
                                                        content: {
                // ここに表示したいデザインを構築
                Image(systemName: "fuelpump.circle.fill").foregroundColor(.green).font(.system(size: 20))
            })}
        ).edgesIgnoringSafeArea(.bottom)
        
    }
}




#Preview {
    Map2View()
}
