//
//  MapViewController.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 9/4/21.
//

import UIKit

class MapViewController: UIViewController {

    let arenaLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Arena"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let arenaRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 20h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 15)

        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    override func viewDidLoad() {
        tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        tabBarController?.selectedIndex = 0

        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "officialMap")?.withTintColor(.red)
        backgroundImageView.contentMode = UIView.ContentMode.scaleAspectFill

        view.addSubview(backgroundImageView)
        view.addSubview(arenaLabel)
        view.addSubview(arenaRainLabel)

        arenaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        arenaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        arenaRainLabel.topAnchor.constraint(equalTo: arenaLabel.bottomAnchor).isActive = true
        arenaRainLabel.centerXAnchor.constraint(equalTo: arenaLabel.centerXAnchor).isActive = true

    }
}
