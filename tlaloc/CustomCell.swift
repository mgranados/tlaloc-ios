//
//  CustomCell.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 7/30/21.
//

import UIKit

class CustomCell: UICollectionViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Castillo de Chapultepec"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "23°C"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "It will rain in 3 hours"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        let bigConfiguration = UIImage.SymbolConfiguration(scale: .large)
        let weatherIcon = UIImage(systemName: "cloud.sun.rain.fill", withConfiguration: bigConfiguration)
        let iconView = UIImageView(image: weatherIcon)
        iconView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleLabel)
        addSubview(temperatureLabel)
        addSubview(iconView)
        addSubview(descriptionLabel)

        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true

        iconView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        iconView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true

        temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        temperatureLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true

        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        
    }

    required init?(coder: NSCoder) {
        fatalError("No init(coder:) in here. We programatic baby.")
    }
}
