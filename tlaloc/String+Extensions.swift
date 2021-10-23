//
//  String+Extensions.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 8/23/21.
//

import Foundation
import UIKit

extension String {
    func humanDateTime() -> String? {
        let originalDateTime = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        if let nextRainDate = dateFormatter.date(from: originalDateTime) {
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: nextRainDate)
        }
        return nil
    }

    func humanIntervalFromDescription() -> String? {
        let unmodifiedDescription = self
        let descriptionArray =  unmodifiedDescription.components(separatedBy: "rain:")
        let lastOfDescription = descriptionArray.last
        if let trimmed = lastOfDescription?.trimmingCharacters(in: .whitespacesAndNewlines) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            if let nextRainDate = dateFormatter.date(from: trimmed) {
                let untilThen = Date().distance(to: nextRainDate)
                let formatter = RelativeDateTimeFormatter()
                let twentyHoursInSeconds = 60 * 60 * 22.0
                if untilThen < 0 {
                    return "Raining now"
                }
                if untilThen >= twentyHoursInSeconds {
                    return "No Rain Today"
                }
                formatter.dateTimeStyle = .named
                let str = formatter.localizedString(fromTimeInterval: untilThen)
                return "Next Rain: \(str)"
            }
        }
        return nil
    }

    func humanHourFromDescription() -> String? {
        let unmodifiedDescription = self
        let descriptionArray =  unmodifiedDescription.components(separatedBy: "rain:")
        let lastOfDescription = descriptionArray.last
        if let trimmed = lastOfDescription?.trimmingCharacters(in: .whitespacesAndNewlines) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            if let nextRainDate = dateFormatter.date(from: trimmed) {
                let untilThen = Date().distance(to: nextRainDate)
                let twentyHoursInSeconds = 60 * 60 * 20.0
                if untilThen <= 0 {
                    return "Raining"
                }
                if untilThen >= twentyHoursInSeconds {
                    return "No Rain"
                }

                let hour = Calendar.current.component(.hour, from: nextRainDate)
                return "Rain at \(hour)"
            }
        }
        return nil
    }

    func hexStringToUIColor () -> UIColor {
        var cString:String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
