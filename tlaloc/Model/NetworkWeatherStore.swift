//
//  NetworkWeatherStore.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 8/21/21.
//

import Foundation

class NetworkWeatherStore: WeatherStore {
    var landmarks: [Landmark] = []
    var networkManager = NetworkManager()

    func updateLandmarks(_ completion: @escaping () -> ()) {
        networkManager.getLandmarksDetailed{ (updatedLandmarks) in
            self.landmarks = updatedLandmarks
        }
    }
}
