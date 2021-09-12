//
//  MapLandmarkView.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 9/10/21.
//

import UIKit

class MapLandmarkView: UIView {
    var nameLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Six Flags"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let rainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 5h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 12)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    init(name: String, rain: String) {
        self.nameLabel.text = name
        self.rainLabel.text = rain
        super.init(frame: CGRect(x: 0, y: 0, width: 120, height: 90))
        self.translatesAutoresizingMaskIntoConstraints = false


        self.addSubview(nameLabel)
        self.addSubview(rainLabel)
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        rainLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        rainLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        preconditionFailure("You shall not build with storyboard")
    }
}
