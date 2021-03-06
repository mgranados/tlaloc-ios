//
//  HourlyWeatherTableViewCell.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 8/7/21.
//

import UIKit

class HourlyWeatherTableViewCell: UITableViewCell {
    var hourLabel: UILabel = {
        let hour = UILabel()
        hour.text = "19:00"
        hour.textColor = .white
        hour.translatesAutoresizingMaskIntoConstraints = false
        return hour
    }()

    var rainDescriptionLabel: UILabel = {
        let rain = UILabel()
        rain.text = "It will be raining"
        rain.textColor = .white
        rain.translatesAutoresizingMaskIntoConstraints = false
        return rain
    }()

    var degreesLabel: UILabel = {
        let degrees = UILabel()
        degrees.text = "22ºC"
        degrees.textColor = .white
        degrees.translatesAutoresizingMaskIntoConstraints = false
        return degrees
    }()

    var iconView: UIImageView = {
        let bigConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        let weatherIcon = UIImage(systemName: "cloud.sun.rain.fill", withConfiguration: bigConfiguration)
        let iconView = UIImageView(image: weatherIcon)
        iconView.tintColor = .white
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return UIImageView()
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(hourLabel)
        addSubview(rainDescriptionLabel)
        addSubview(degreesLabel)
        addSubview(iconView)

        backgroundColor = .black

        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor(named: "white")?.cgColor

        hourLabel.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        hourLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        hourLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true

        rainDescriptionLabel.topAnchor.constraint(equalTo: hourLabel.topAnchor).isActive = true
        rainDescriptionLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 8).isActive = true

        iconView.topAnchor.constraint(equalTo: hourLabel.topAnchor).isActive = true
        iconView.leadingAnchor.constraint(equalTo: hourLabel.trailingAnchor, constant: 8).isActive = true

        degreesLabel.topAnchor.constraint(equalTo: hourLabel.topAnchor).isActive = true
        degreesLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true

        let selectedBgView = UIView(frame: bounds)
        let primaryTintColor = "#64b5f6".hexStringToUIColor()

        selectedBgView.backgroundColor = primaryTintColor
        selectedBackgroundView = selectedBgView
    }

    required init?(coder: NSCoder) {
        preconditionFailure("Epale, no storyboards")
    }
}

extension UILabel {
    convenience init(withText text: String) {
        self.init()
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
