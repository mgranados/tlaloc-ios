//
//  WeatherStore.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 7/26/21.
//

import Foundation


protocol WeatherStore {
    var landmarks: [Landmark] { get }
    var lastUpdate: String { get set }
    func updateLandmarks(_ completion: @escaping () -> ())
    func updateDetailLandmarks(_ completion: @escaping () -> ())
}
