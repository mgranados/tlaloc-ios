//
//  MapViewController.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 9/4/21.
//

import UIKit

class MapViewController: UIViewController {
    var networkManager = NetworkManager()
    var landmarks: [Landmark?] = []

    let arenaLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Arena", rain: "Rain in 35h")
    }()
    let basilicaLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Basílica", rain: "Rain in 36h")
    }()
    let bicentenarioLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Bicentenario", rain: "Rain in 37h")
    }()
    let buenavistaLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Buenavista", rain: "Rain in 38h")
    }()
    let airportLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Airport", rain: "Rain in 39h")
    }()
    let soumayaLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Soumaya", rain: "Rain in 40h")
    }()
    let castleLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Chapultepec", rain: "Rain in 41h")
    }()
    let condesaLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Condesa", rain: "Rain in 42h")
    }()
    let santafeLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Santa Fé", rain: "Rain in 43h")
    }()
    let cinetecaLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Cineteca", rain: "Rain in 44h")
    }()
    let abastosLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Abastos", rain: "Rain in 45h")
    }()
    let unamLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "UNAM", rain: "Rain in 46h")
    }()
    let aztecaLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Azteca", rain: "Rain in 47h")
    }()
    let sixflagsLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Six Flags", rain: "Rain in 48h")
    }()
    let xochimilcoLandmarkView: MapLandmarkView = {
        return MapLandmarkView(name: "Xochimilco", rain: "Rain in 49h")
    }()
    let forosolLandmarkView = MapLandmarkView(name: "Foro Sol", rain: "Rain in 50h")

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "CDMX Today"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 48, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    let refreshButtonView: UIImageView = {
        let large = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)

        let refreshIcon = UIImage(systemName: "arrow.clockwise", withConfiguration: large)
        let iconView = UIImageView(image: refreshIcon)
        iconView.tintColor = .white
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.isUserInteractionEnabled = true
        return iconView
    }()

    let lastUpdateLabel: UILabel = {
        let lastUpdateLabel = UILabel()
        lastUpdateLabel.text = "last update: beginning of time"
        lastUpdateLabel.textColor = .white
        lastUpdateLabel.font = UIFont.systemFont(ofSize: 11, weight: .light)
        lastUpdateLabel.translatesAutoresizingMaskIntoConstraints = false

        return lastUpdateLabel
    }()

    override func viewDidLoad() {
        let config = UIImage.SymbolConfiguration(scale: .default)
        let mapImage = UIImage(systemName: "map.fill", withConfiguration: config)
        tabBarItem = UITabBarItem(title: "Map", image: mapImage, tag: 0)
        tabBarController?.selectedIndex = 0

        networkManager.getLandmarks {
            [weak self] (newLandmarks) in
            DispatchQueue.main.async {
                self?.landmarks = newLandmarks
                self?.refreshRainData()
                let lastUpdateString = self?.formatLastUpdateFrom(Date())
                self?.lastUpdateLabel.text = "last update: \(lastUpdateString ?? "can't recall")"
            }
        }

        // iPhone SE / 5
        if (self.view.frame.width <= 320) {
            titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
            lastUpdateLabel.font = UIFont.systemFont(ofSize: 10, weight: .light)
        }

        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "officialMap")?.withTintColor(.red)
        backgroundImageView.contentMode = UIView.ContentMode.scaleAspectFill

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(refreshTapped(_:)))
        refreshButtonView.addGestureRecognizer(tapGestureRecognizer)

        view.addSubview(backgroundImageView)

        view.addSubview(arenaLandmarkView)
        view.addSubview(basilicaLandmarkView)
        view.addSubview(bicentenarioLandmarkView)
        view.addSubview(buenavistaLandmarkView)
        view.addSubview(airportLandmarkView)
        view.addSubview(soumayaLandmarkView)
        view.addSubview(castleLandmarkView)
        view.addSubview(condesaLandmarkView)
        view.addSubview(santafeLandmarkView)
        view.addSubview(cinetecaLandmarkView)
        view.addSubview(abastosLandmarkView)
        view.addSubview(unamLandmarkView)
        view.addSubview(aztecaLandmarkView)
        view.addSubview(sixflagsLandmarkView)
        view.addSubview(xochimilcoLandmarkView)
        view.addSubview(forosolLandmarkView)

        view.addSubview(refreshButtonView)
        view.addSubview(titleLabel)
        view.addSubview(lastUpdateLabel)

        arenaLandmarkView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: backgroundImageView.bounds.height * 0.165).isActive = true
        arenaLandmarkView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.35).isActive = true

        basilicaLandmarkView.topAnchor.constraint(equalTo: arenaLandmarkView.topAnchor, constant: backgroundImageView.bounds.height * 0.01).isActive = true
        basilicaLandmarkView.leadingAnchor.constraint(equalTo: arenaLandmarkView.trailingAnchor, constant: backgroundImageView.bounds.width * 0.2).isActive = true

        bicentenarioLandmarkView.topAnchor.constraint(equalTo: basilicaLandmarkView.bottomAnchor, constant: backgroundImageView.bounds.height * 0.04).isActive = true
        bicentenarioLandmarkView.leadingAnchor.constraint(equalTo:  view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.25).isActive = true

        buenavistaLandmarkView.topAnchor.constraint(equalTo: bicentenarioLandmarkView.bottomAnchor, constant: backgroundImageView.bounds.height * 0.035).isActive = true
        buenavistaLandmarkView.leadingAnchor.constraint(equalTo: bicentenarioLandmarkView.trailingAnchor, constant: backgroundImageView.bounds.width * 0.2).isActive = true

        airportLandmarkView.topAnchor.constraint(equalTo: buenavistaLandmarkView.bottomAnchor, constant: backgroundImageView.bounds.height * 0.02).isActive = true
        airportLandmarkView.leadingAnchor.constraint(equalTo: basilicaLandmarkView.trailingAnchor, constant: backgroundImageView.bounds.width * 0.15).isActive = true

        soumayaLandmarkView.topAnchor.constraint(equalTo: buenavistaLandmarkView.bottomAnchor, constant: backgroundImageView.bounds.height * 0.01).isActive = true
        soumayaLandmarkView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.21).isActive = true

        castleLandmarkView.topAnchor.constraint(equalTo: soumayaLandmarkView.bottomAnchor, constant:  backgroundImageView.bounds.height * 0.055).isActive = true
        castleLandmarkView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.16).isActive = true

        condesaLandmarkView.topAnchor.constraint(equalTo: soumayaLandmarkView.bottomAnchor, constant: backgroundImageView.bounds.height * 0.04).isActive = true
        condesaLandmarkView.leadingAnchor.constraint(equalTo: castleLandmarkView.trailingAnchor, constant: backgroundImageView.bounds.width * 0.25).isActive = true

        santafeLandmarkView.topAnchor.constraint(equalTo: castleLandmarkView.bottomAnchor, constant: backgroundImageView.bounds.height * 0.085).isActive = true
        santafeLandmarkView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.02).isActive = true

        cinetecaLandmarkView.topAnchor.constraint(equalTo: santafeLandmarkView.topAnchor).isActive = true
        cinetecaLandmarkView.leadingAnchor.constraint(equalTo: condesaLandmarkView.leadingAnchor).isActive = true

        abastosLandmarkView.topAnchor.constraint(equalTo: cinetecaLandmarkView.topAnchor).isActive = true
        abastosLandmarkView.leadingAnchor.constraint(equalTo: airportLandmarkView.leadingAnchor, constant: backgroundImageView.bounds.width * 0.02).isActive = true

        unamLandmarkView.topAnchor.constraint(equalTo: santafeLandmarkView.bottomAnchor, constant: backgroundImageView.bounds.height * 0.08).isActive = true
        unamLandmarkView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: backgroundImageView.bounds.width * 0.30).isActive = true

        aztecaLandmarkView.topAnchor.constraint(equalTo: unamLandmarkView.bottomAnchor, constant: backgroundImageView.bounds.height * 0.01).isActive = true
        aztecaLandmarkView.centerXAnchor.constraint(equalTo: buenavistaLandmarkView.centerXAnchor, constant: backgroundImageView.bounds.width * 0.05).isActive = true

        sixflagsLandmarkView.topAnchor.constraint(equalTo: aztecaLandmarkView.bottomAnchor, constant: backgroundImageView.bounds.height * 0.06
        ).isActive = true
        sixflagsLandmarkView.leadingAnchor.constraint(equalTo: castleLandmarkView.leadingAnchor).isActive = true

        xochimilcoLandmarkView.topAnchor.constraint(equalTo: sixflagsLandmarkView.bottomAnchor, constant: backgroundImageView.bounds.height * 0.05).isActive = true
        xochimilcoLandmarkView.leadingAnchor.constraint(equalTo: aztecaLandmarkView.trailingAnchor, constant: backgroundImageView.bounds.width * 0.14).isActive = true

        forosolLandmarkView.topAnchor.constraint(equalTo: airportLandmarkView.bottomAnchor, constant: backgroundImageView.bounds.height * 0.045).isActive = true
        forosolLandmarkView.leadingAnchor.constraint(equalTo: xochimilcoLandmarkView.leadingAnchor).isActive = true

        refreshButtonView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        refreshButtonView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -16).isActive = true

        titleLabel.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -backgroundImageView.bounds.height * 0.12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -backgroundImageView.bounds.width * 0.04).isActive = true

        lastUpdateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        lastUpdateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
    }

    func refreshRainData() {
        let arenaDescription = getLandmarkDescription(for: "Arena Ciudad de Mexico")
        arenaLandmarkView.rainLabel.text = arenaDescription

        let basilicaDescription = getLandmarkDescription(for: "Basílica de Guadalupe")
        basilicaLandmarkView.rainLabel.text = basilicaDescription

        let bicentenarioDescription = getLandmarkDescription(for: "Parque Bicentenario")
        bicentenarioLandmarkView.rainLabel.text = bicentenarioDescription

        let buenavistaDescription = getLandmarkDescription(for: "Fórum Buenavista")
        buenavistaLandmarkView.rainLabel.text = buenavistaDescription

        let soumayaDescription = getLandmarkDescription(for: "Museo Soumaya")
        soumayaLandmarkView.rainLabel.text = soumayaDescription

        let airportDescription = getLandmarkDescription(for: "Aeropuerto")
        airportLandmarkView.rainLabel.text = airportDescription

        let castleDescription = getLandmarkDescription(for: "Castillo de Chapultepec")
        castleLandmarkView.rainLabel.text = castleDescription

        let condesaDescription = getLandmarkDescription(for: "Parque México")
        condesaLandmarkView.rainLabel.text = condesaDescription

        let santafeDescription = getLandmarkDescription(for: "Santa Fé")
        santafeLandmarkView.rainLabel.text = santafeDescription

        let cinetecaDescription = getLandmarkDescription(for: "Cineteca")
        cinetecaLandmarkView.rainLabel.text = cinetecaDescription

        let abastosDescription = getLandmarkDescription(for: "Central de Abastos")
        abastosLandmarkView.rainLabel.text = abastosDescription

        let unamDescription = getLandmarkDescription(for: "UNAM")
        unamLandmarkView.rainLabel.text = unamDescription

        let aztecaDescription = getLandmarkDescription(for: "Estadio Azteca")
        aztecaLandmarkView.rainLabel.text = aztecaDescription

        let sixflagsDescription = getLandmarkDescription(for: "Six Flags")
        sixflagsLandmarkView.rainLabel.text = sixflagsDescription

        let xochimilcoDescription = getLandmarkDescription(for: "Trajineras Xochimilco")
        xochimilcoLandmarkView.rainLabel.text = xochimilcoDescription

        let forosolDescription = getLandmarkDescription(for: "Foro Sol")
        forosolLandmarkView.rainLabel.text = forosolDescription
    }

    func getLandmarkDescription(for name: String) -> String? {
        guard let landmarkIndex = self.landmarks.firstIndex(where: {$0?.name == name}) else { return nil }
        let landmarkData = self.landmarks[landmarkIndex]
        if let nextRainEpoch = landmarkData?.nextRainEpoch {
            return getNextRainHumanDescription(nextRainEpoch: nextRainEpoch)
        } else {
            return "No idea"
        }
    }

    func getNextRainHumanDescription(nextRainEpoch: Int) -> String {
        if nextRainEpoch < 1 {
            return "No rain"
        }

        let nextRainDate = Date(timeIntervalSince1970: Double(nextRainEpoch))
        let untilNextRain = Date().distance(to: nextRainDate)
        let twentyHoursInSeconds = 60 * 60 * 20.0
        if untilNextRain < 1200 {
            return "Raining"
        }
        if untilNextRain >= twentyHoursInSeconds {
            return "No rain"
        }
        let hour = Calendar.current.component(.hour, from: nextRainDate)
        return "Rain at \(hour)"
    }

    @objc func refreshTapped(_ sender: UITapGestureRecognizer) {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        feedbackGenerator.impactOccurred()

        refreshButtonView.rotate()
        networkManager.getLandmarks {
            [weak self] (newLandmarks) in
            DispatchQueue.main.async {
                self?.landmarks = newLandmarks
                self?.refreshRainData()
                let lastUpdateString = self?.formatLastUpdateFrom(Date())
                self?.lastUpdateLabel.text = "last update: \(lastUpdateString ?? "can't recall")"
            }
        }
    }

    func formatLastUpdateFrom(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .short
        let timeFormatter = DateFormatter()
        timeFormatter.timeZone = TimeZone.current
        timeFormatter.locale = Locale.current
        timeFormatter.timeStyle = .short
        return "\(dateFormatter.string(from: date)) \(timeFormatter.string(from: date))"
    }
}

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = 1
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
