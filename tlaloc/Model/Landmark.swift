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
    var nextRainEpoch: Int
    var weatherReports: [WeatherReport]?

    enum CodingKeys: String, CodingKey {
        case name
        case latitude
        case longitude
        case description
        case weatherReports = "reports"
        case nextRainEpoch = "next_rain"
    }
}


struct LandmarkReponse: Codable {
    var landmarks: [Landmark]
}
