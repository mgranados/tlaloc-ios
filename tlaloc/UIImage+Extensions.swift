//
//  UIImage+Extensions.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 8/24/21.
//

import UIKit

extension UIImage {
    convenience init?(weatherCode: Int) {
        let bigConfiguration = UIImage.SymbolConfiguration(scale: .large)
        guard let symbolName = getSFSymbolNameFromCode(weatherCode) else { return nil }
        self.init(systemName: symbolName, withConfiguration: bigConfiguration)
    }
}

func getSFSymbolNameFromCode(_ code: Int) -> String? {
    switch code {
    case 1000, 1100:
        return "sun.max.fill"
    case 1001, 1101, 1102:
        return "cloud.fill"
    case 2000, 2100:
        return "cloud.fog"
    case 8000:
        return "cloud.bolt"
    case 4000, 6000:
        return "cloud.drizzle.fill"
    case 6200, 6001, 4200, 4001:
        return "cloud.rain.fill"
    case 6201, 4201:
        return "cloud.heavyrain.fill"
    default:
        return nil
    }
}
