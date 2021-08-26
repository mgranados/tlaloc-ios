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

    var iconView: UIImageView = {
        let bigConfiguration = UIImage.SymbolConfiguration(scale: .large)
        let weatherIcon = UIImage(systemName: "sun.fill", withConfiguration: bigConfiguration)
        let iconView = UIImageView(image: weatherIcon)
        iconView.tintColor = .white
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return UIImageView()
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(titleLabel)
        addSubview(temperatureLabel)
        addSubview(iconView)
        addSubview(descriptionLabel)

        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true

        temperatureLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        temperatureLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true

        iconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        iconView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

        let selectedBg = UIView(frame: bounds)
        selectedBg.backgroundColor = .red
        selectedBg.layer.cornerRadius = 10
        self.selectedBackgroundView = selectedBg
        let slightlyMoved = CGPoint(x: self.layer.bounds.midX + 5, y: self.layer.bounds.midY - 5)
        self.selectedBackgroundView?.layer.position = slightlyMoved

        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 10
        
    }

    required init?(coder: NSCoder) {
        fatalError("No init(coder:) in here. We programatic baby.")
    }
}
