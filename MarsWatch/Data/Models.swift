//
//  Models.swift
//  NCX
//
//  Created by Giuseppe Rocco on 22/03/23.
//

import Foundation
import SwiftUI

struct Rover: Hashable {
    let name: String
    let mission: String
    let imgSrc: String
}

struct Camera: Codable {
    let name: String
    let fullName: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
    }
}

struct LatestPhotos: Codable {
    let photos: [Photo]
    
    private enum CodingKeys: String, CodingKey {
        case photos = "latest_photos"
    }
}

struct Photo: Codable, Identifiable {
    let id: Int
    let sol: Int
    let camera: Camera
    let imageSource: String
    let earthDate: String
    let rover: PhotoRoverReference
    
    private enum CodingKeys: String, CodingKey {
        case id
        case sol
        case camera
        case imageSource = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

struct PhotoRoverReference: Codable {
    let id: Int
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}

struct PhotosContainer: Codable {
    let photos: [Photo]
    
    private enum CodingKeys: String, CodingKey {
        case photos
    }
}
