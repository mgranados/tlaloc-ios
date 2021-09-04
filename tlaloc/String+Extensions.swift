//
//  String+Extensions.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 8/23/21.
//

import Foundation

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
                if untilThen < 0 {
                    return "Raining right now"
                }
                formatter.dateTimeStyle = .named
                let str = formatter.localizedString(fromTimeInterval: untilThen)
                return "Rain \(str)"
            }
        }
        return nil
    }
}
