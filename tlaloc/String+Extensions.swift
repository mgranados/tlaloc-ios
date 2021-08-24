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
}
