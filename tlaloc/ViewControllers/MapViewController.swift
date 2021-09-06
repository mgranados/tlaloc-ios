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
        rainLabel.font = UIFont.systemFont(ofSize: 13)

        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let basilicaLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Basílica"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let basilicaRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "No Rain"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let bicentenarioLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Bicentenario"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let bicentenarioRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 20h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let buenavistaLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Buenavista"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let buenavistaRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 18h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let soumayaLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Soumaya"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let soumayaRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 21h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let airportLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Airport"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let airportRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Raining now"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let castleLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Chapultepec"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let castleRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 9h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let condesaLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Condesa"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let condesaRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 11h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let santafeLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Santa Fé"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let santafeRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 3h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let cinetecaLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Cineteca"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let cinetecaRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 13h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let abastosLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Abastos"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let abastosRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 3h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let unamLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "UNAM"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let unamRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Raining now"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let aztecaLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Azteca"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let aztecaRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 10h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let sixflagsLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Six Flags"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let sixflagsRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 5h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
        rainLabel.translatesAutoresizingMaskIntoConstraints = false
        return rainLabel
    }()

    let xochimilcoLabel: UILabel = {
        let landmarkLabel = UILabel()
        landmarkLabel.text = "Xochimilco"
        landmarkLabel.textColor = .white
        landmarkLabel.font = UIFont.systemFont(ofSize: 14)
        landmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        return landmarkLabel
    }()

    let xochimilcoRainLabel: UILabel = {
        let rainLabel = UILabel()
        rainLabel.text = "Rain in 2h"
        rainLabel.textColor = .white
        rainLabel.font = UIFont.systemFont(ofSize: 13)
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
        view.addSubview(basilicaLabel)
        view.addSubview(basilicaRainLabel)
        view.addSubview(bicentenarioLabel)
        view.addSubview(bicentenarioRainLabel)
        view.addSubview(buenavistaLabel)
        view.addSubview(buenavistaRainLabel)
        view.addSubview(soumayaLabel)
        view.addSubview(soumayaRainLabel)
        view.addSubview(airportLabel)
        view.addSubview(airportRainLabel)
        view.addSubview(castleLabel)
        view.addSubview(castleRainLabel)
        view.addSubview(condesaLabel)
        view.addSubview(condesaRainLabel)
        view.addSubview(santafeLabel)
        view.addSubview(santafeRainLabel)
        view.addSubview(cinetecaLabel)
        view.addSubview(cinetecaRainLabel)
        view.addSubview(abastosLabel)
        view.addSubview(abastosRainLabel)
        view.addSubview(unamLabel)
        view.addSubview(unamRainLabel)
        view.addSubview(aztecaLabel)
        view.addSubview(aztecaRainLabel)
        view.addSubview(sixflagsLabel)
        view.addSubview(sixflagsRainLabel)
        view.addSubview(xochimilcoLabel)
        view.addSubview(xochimilcoRainLabel)

        arenaLabel.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: backgroundImageView.bounds.height * 0.165).isActive = true
        arenaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.35).isActive = true
        arenaRainLabel.topAnchor.constraint(equalTo: arenaLabel.bottomAnchor).isActive = true
        arenaRainLabel.centerXAnchor.constraint(equalTo: arenaLabel.centerXAnchor).isActive = true

        basilicaLabel.topAnchor.constraint(equalTo: arenaLabel.topAnchor, constant: backgroundImageView.bounds.height * 0.01).isActive = true
        basilicaLabel.leadingAnchor.constraint(equalTo: arenaLabel.trailingAnchor, constant: backgroundImageView.bounds.width * 0.1).isActive = true
        basilicaRainLabel.topAnchor.constraint(equalTo: basilicaLabel.bottomAnchor).isActive = true
        basilicaRainLabel.centerXAnchor.constraint(equalTo: basilicaLabel.centerXAnchor).isActive = true

        bicentenarioLabel.topAnchor.constraint(equalTo: basilicaRainLabel.bottomAnchor, constant: backgroundImageView.bounds.height * 0.001).isActive = true
        bicentenarioLabel.leadingAnchor.constraint(equalTo:  view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.25).isActive = true
        bicentenarioRainLabel.topAnchor.constraint(equalTo: bicentenarioLabel.bottomAnchor).isActive = true
        bicentenarioRainLabel.centerXAnchor.constraint(equalTo: bicentenarioLabel.centerXAnchor).isActive = true

        buenavistaLabel.topAnchor.constraint(equalTo: bicentenarioLabel.bottomAnchor, constant: backgroundImageView.bounds.height * 0.01).isActive = true
        buenavistaLabel.leadingAnchor.constraint(equalTo: bicentenarioLabel.trailingAnchor).isActive = true
        buenavistaRainLabel.topAnchor.constraint(equalTo: buenavistaLabel.bottomAnchor).isActive = true
        buenavistaRainLabel.centerXAnchor.constraint(equalTo: buenavistaLabel.centerXAnchor).isActive = true

        soumayaLabel.topAnchor.constraint(equalTo: buenavistaLabel.bottomAnchor).isActive = true
        soumayaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.20).isActive = true
        soumayaRainLabel.topAnchor.constraint(equalTo: soumayaLabel.bottomAnchor).isActive = true
        soumayaRainLabel.centerXAnchor.constraint(equalTo: soumayaLabel.centerXAnchor).isActive = true

        airportLabel.topAnchor.constraint(equalTo: buenavistaLabel.bottomAnchor).isActive = true
        airportLabel.leadingAnchor.constraint(equalTo: basilicaLabel.trailingAnchor, constant: backgroundImageView.bounds.width * 0.025).isActive = true
        airportRainLabel.topAnchor.constraint(equalTo: airportLabel.bottomAnchor).isActive = true
        airportRainLabel.centerXAnchor.constraint(equalTo: airportLabel.centerXAnchor).isActive = true

        castleLabel.topAnchor.constraint(equalTo: soumayaRainLabel.bottomAnchor, constant:  backgroundImageView.bounds.height * 0.01).isActive = true
        castleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.16).isActive = true
        castleRainLabel.topAnchor.constraint(equalTo: castleLabel.bottomAnchor).isActive = true
        castleRainLabel.centerXAnchor.constraint(equalTo: castleLabel.centerXAnchor).isActive = true

        condesaLabel.topAnchor.constraint(equalTo: soumayaRainLabel.bottomAnchor, constant: backgroundImageView.bounds.height * 0.001).isActive = true
        condesaLabel.leadingAnchor.constraint(equalTo: castleLabel.trailingAnchor, constant: backgroundImageView.bounds.width * 0.03).isActive = true
        condesaRainLabel.topAnchor.constraint(equalTo: condesaLabel.bottomAnchor).isActive = true
        condesaRainLabel.centerXAnchor.constraint(equalTo: condesaLabel.centerXAnchor).isActive = true

        santafeLabel.topAnchor.constraint(equalTo: castleRainLabel.bottomAnchor, constant: backgroundImageView.bounds.height * 0.04).isActive = true
        santafeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.03).isActive = true
        santafeRainLabel.topAnchor.constraint(equalTo: santafeLabel.bottomAnchor).isActive = true
        santafeRainLabel.centerXAnchor.constraint(equalTo: santafeLabel.centerXAnchor).isActive = true

        cinetecaLabel.topAnchor.constraint(equalTo: santafeLabel.topAnchor).isActive = true
        cinetecaLabel.leadingAnchor.constraint(equalTo: condesaRainLabel.leadingAnchor).isActive = true
        cinetecaRainLabel.topAnchor.constraint(equalTo: cinetecaLabel.bottomAnchor).isActive = true
        cinetecaRainLabel.centerXAnchor.constraint(equalTo: cinetecaLabel.centerXAnchor).isActive = true

        abastosLabel.topAnchor.constraint(equalTo: cinetecaLabel.topAnchor).isActive = true
        abastosLabel.leadingAnchor.constraint(equalTo: cinetecaLabel.trailingAnchor, constant: backgroundImageView.bounds.width * 0.18).isActive = true
        abastosRainLabel.topAnchor.constraint(equalTo: abastosLabel.bottomAnchor).isActive = true
        abastosRainLabel.centerXAnchor.constraint(equalTo: abastosLabel.centerXAnchor).isActive = true

        unamLabel.topAnchor.constraint(equalTo: santafeLabel.bottomAnchor, constant: backgroundImageView.bounds.height * 0.07).isActive = true
        unamLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.30).isActive = true
        unamRainLabel.topAnchor.constraint(equalTo: unamLabel.bottomAnchor).isActive = true
        unamRainLabel.centerXAnchor.constraint(equalTo: unamLabel.centerXAnchor).isActive = true

        aztecaLabel.topAnchor.constraint(equalTo: unamLabel.bottomAnchor).isActive = true
        aztecaLabel.leadingAnchor.constraint(equalTo: unamLabel.trailingAnchor, constant: backgroundImageView.bounds.width * 0.1).isActive = true
        aztecaRainLabel.topAnchor.constraint(equalTo: aztecaLabel.bottomAnchor).isActive = true
        aztecaRainLabel.centerXAnchor.constraint(equalTo: aztecaLabel.centerXAnchor).isActive = true

        sixflagsLabel.topAnchor.constraint(equalTo: aztecaRainLabel.bottomAnchor).isActive = true
        sixflagsLabel.leadingAnchor.constraint(equalTo: castleLabel.leadingAnchor).isActive = true
        sixflagsRainLabel.topAnchor.constraint(equalTo: sixflagsLabel.bottomAnchor).isActive = true
        sixflagsRainLabel.centerXAnchor.constraint(equalTo: sixflagsLabel.centerXAnchor).isActive = true

        xochimilcoLabel.topAnchor.constraint(equalTo: sixflagsLabel.bottomAnchor, constant: backgroundImageView.bounds.height * 0.03).isActive = true
        xochimilcoLabel.leadingAnchor.constraint(equalTo: aztecaLabel.trailingAnchor).isActive = true
        xochimilcoRainLabel.topAnchor.constraint(equalTo: xochimilcoLabel.bottomAnchor).isActive = true
        xochimilcoRainLabel.centerXAnchor.constraint(equalTo: xochimilcoLabel.centerXAnchor).isActive = true
    }
}
