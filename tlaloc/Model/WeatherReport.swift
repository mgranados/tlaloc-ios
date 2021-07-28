//
//  WeatherReport.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 7/26/21.
//

import Foundation

struct WeatherReport {
    var time: String
    var temperature: Double
    var tomorrowCode: Int
    var precipitationProbability: Double
    var precipitationType: Int // This can be an ENUM
}
