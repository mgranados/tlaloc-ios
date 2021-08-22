//
//  Landmark.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 7/26/21.
//

import Foundation

struct Landmark: Codable {
    var name: String
    var latitude: String
    var longitude: String
    var description: String
    var weatherReports: [WeatherReport]?

    enum CodingKeys: String, CodingKey {
        case name
        case latitude
        case longitude
        case description
        case weatherReports = "reports"
    }
}


struct LandmarkReponse: Codable {
    var landmarks: [Landmark]
}
