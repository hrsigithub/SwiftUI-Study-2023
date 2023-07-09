//
//  Landmark.swift
//  Landmarks
//
//  Created by Hiroshi.Nakai on 2023/01/17.
//

import Foundation
import SwiftUI
import CoreLocation


// Identifiable → データモデルが一意に識別されることを示します。idが必須
//
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // イメージ名は非公開
    private var imageName: String
    
    // イメージ名をセットして、イメージを返却する。
    var image: Image {
        Image(imageName)
    }
    
    // coordinatesは非公開
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

