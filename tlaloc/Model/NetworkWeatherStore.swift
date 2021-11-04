//
//  NetworkWeatherStore.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 8/21/21.
//

import Foundation

class NetworkWeatherStore: WeatherStore {
    var landmarks: [Landmark] = []
    var lastUpdate: String = ""
    var networkManager = NetworkManager()

    func updateLandmarks(_ completion: @escaping () -> ()) {
        networkManager.getLandmarks { (newLandmarks) in
            DispatchQueue.main.async {
                self.landmarks = newLandmarks
                self.lastUpdate = "last update: \(self.formatLastUpdateFrom(Date()))"
                completion()
            }
        }
    }

    func updateDetailLandmarks(_ completion: @escaping () -> ()) {
        networkManager.getLandmarksDetailed { (newDetailedLandmarks) in
            DispatchQueue.main.async {
                self.landmarks = newDetailedLandmarks
                self.lastUpdate = "last updated: \(self.formatLastUpdateFrom(Date()))"
                completion()
            }
        }
    }

    func formatLastUpdateFrom(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .short
        let timeFormatter = DateFormatter()
        timeFormatter.timeZone = TimeZone.current
        timeFormatter.locale = Locale.current
        timeFormatter.timeStyle = .medium
        return "\(dateFormatter.string(from: date)) \(timeFormatter.string(from: date))"
    }
}
