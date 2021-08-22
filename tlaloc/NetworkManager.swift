//
//  NetworkManager.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 8/21/21.
//

import Foundation

struct NetworkManager {
    private var host = "api.mgrands.com"
    private var scheme = "https"

    func getLandmarks(completionHandler: @escaping (_ landmarks: [Landmark]) -> Void) {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = "/landmarks"

        guard let url = components.url else {
            preconditionFailure("Failed to construct URL")
        }

        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in

            if let data = data {
                let encoder = JSONDecoder()
                let landmarkResponse = try! encoder.decode(LandmarkReponse.self, from: data)
                completionHandler(landmarkResponse.landmarks)
            }
        }
        task.resume()
    }

    func getLandmarksDetailed(completionHandler: @escaping (_ landmarks: [Landmark]) -> Void) {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = "/landmarks-detail"

        guard let url = components.url else {
            preconditionFailure("Failed to construct URL")
        }

        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in

            if let data = data {
                let encoder = JSONDecoder()
                let landmarkResponse = try! encoder.decode(LandmarkReponse.self, from: data)
                completionHandler(landmarkResponse.landmarks)
            }
        }
        task.resume()
    }
}
