//
//  LocalWeatherStore.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 7/27/21.
//

import Foundation

struct LocalWeatherStore: WeatherStore {
    func updateLandmarks(_ completion: @escaping () -> ()) {
        print("not here yet")
    }

    var landmarks: [Landmark] {
        get {
            let defaultLandmarks = [
                Landmark(
                    name: "Castillo de Chapultepec",
                    latitude: "19.4204397", longitude: "-99.184129",
                    description: "It will rain in 5 hours",
                    nextRainEpoch: Int(Date().timeIntervalSince1970) + 21000, // ~5h
                    weatherReports: [
                    WeatherReport(time: "2021-12-27T19:00:00-05:00", temperature: 23.12, tomorrowCode: 1001, precipitationProbability: 0.0, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 3600),
                    WeatherReport(time: "2021-12-27T20:00:00-05:00", temperature: 14.13, tomorrowCode: 4000, precipitationProbability: 15, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 7200),
                    WeatherReport(time: "2021-12-27T21:00:00-05:00", temperature: 12.13, tomorrowCode: 4000, precipitationProbability: 35, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 10200),
                    WeatherReport(time: "2021-12-27T22:00:00-05:00", temperature: 11.00, tomorrowCode: 4000, precipitationProbability: 35, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 14200),
                    WeatherReport(time: "2021-12-27T23:00:00-05:00", temperature: 11.00, tomorrowCode: 4000, precipitationProbability: 35, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 17200),

                ]),
                Landmark(name: "Estadio Azteca", latitude: "19.3028607", longitude: "-99.1527217", description: "Raining right now",
                     nextRainEpoch: Int(Date().timeIntervalSince1970) + 21000, // ~5h
                    weatherReports: [
                    WeatherReport(time: "2021-10-27T19:00:00-05:00", temperature: 18.81, tomorrowCode: 4200, precipitationProbability: 55, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 3600),
                    WeatherReport(time: "2021-10-27T20:00:00-05:00", temperature: 16.12, tomorrowCode: 4200, precipitationProbability: 65, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 7200),
                    WeatherReport(time: "2021-10-27T21:00:00-05:00", temperature: 12.13, tomorrowCode: 4200, precipitationProbability: 40, precipitationType: 1,  timeEpoch: Int(Date().timeIntervalSince1970) + 10200),
                    WeatherReport(time: "2021-10-27T22:00:00-05:00", temperature: 12.13, tomorrowCode: 4200, precipitationProbability: 40, precipitationType: 1,  timeEpoch: Int(Date().timeIntervalSince1970) + 13200),
                    WeatherReport(time: "2021-10-27T23:00:00-05:00", temperature: 12.13, tomorrowCode: 4200, precipitationProbability: 40, precipitationType: 1,  timeEpoch: Int(Date().timeIntervalSince1970) + 17200),

                ]),
                Landmark(name: "Parque México", latitude: "19.4116891", longitude: "-99.1717111", description: "No rain today",
                     nextRainEpoch: Int(Date().timeIntervalSince1970) + 21000, // ~5h
                    weatherReports: [
                    WeatherReport(time: "2021-10-27T19:00:00-05:00", temperature: 20.81, tomorrowCode: 1001, precipitationProbability: 0, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 3600),
                    WeatherReport(time: "2021-10-27T20:00:00-05:00", temperature: 18.01, tomorrowCode: 1001, precipitationProbability: 0, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 7200),
                    WeatherReport(time: "2021-10-27T21:00:00-05:00", temperature: 17.03, tomorrowCode: 1001, precipitationProbability: 0, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 10200),
                    WeatherReport(time: "2021-10-27T22:00:00-05:00", temperature: 17.03, tomorrowCode: 1001, precipitationProbability: 0, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 13600),
                    WeatherReport(time: "2021-10-27T23:00:00-05:00", temperature: 17.03, tomorrowCode: 1001, precipitationProbability: 0, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 17600),
                ]),
                Landmark(name: "Bellas Artes", latitude: "19.4352", longitude: "-99.143394", description: "No rain today",
                         nextRainEpoch: Int(Date().timeIntervalSince1970) + 21000, // ~5h
                    weatherReports: [
                    WeatherReport(time: "2021-10-27T19:00:00-05:00", temperature: 19.01, tomorrowCode: 1001, precipitationProbability: 0, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 3600),
                    WeatherReport(time: "2021-10-27T20:00:00-05:00", temperature: 19.01, tomorrowCode: 1001, precipitationProbability: 0, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 7200),
                    WeatherReport(time: "2021-10-27T21:00:00-05:00", temperature: 19.01, tomorrowCode: 1001, precipitationProbability: 0, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 10600),
                    WeatherReport(time: "2021-10-27T22:00:00-05:00", temperature: 19.01, tomorrowCode: 1001, precipitationProbability: 0, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 13600),
                    WeatherReport(time: "2021-10-27T23:00:00-05:00", temperature: 19.01, tomorrowCode: 1001, precipitationProbability: 0, precipitationType: 1, timeEpoch: Int(Date().timeIntervalSince1970) + 17600),
                ])
            ]
            return defaultLandmarks
        }
    }

    func updateLandmarks() {
        print("No Local Update Needed")
    }
}
