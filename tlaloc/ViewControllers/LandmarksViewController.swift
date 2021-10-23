//
//  ViewController.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 7/26/21.
//

import UIKit

class LandmarksViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    public let cellId: String = "cellId"
    var weatherStore: WeatherStore? = nil
    var networkManager = NetworkManager()
    var landmarks: [Landmark?] = []

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        let config = UIImage.SymbolConfiguration(scale: .default)
        let listImage = UIImage(systemName: "list.star", withConfiguration: config)
        tabBarItem = UITabBarItem(title: "Landmarks", image: listImage, tag: 1)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black


        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: cellId)

        networkManager.getLandmarksDetailed {
            [weak self] (newLandmarks) in
            DispatchQueue.main.async {
                self?.landmarks = newLandmarks
                self?.collectionView.reloadData()
            }
        }
        let primaryTintColor = "#64b5f6".hexStringToUIColor()

        collectionView.backgroundColor = .black
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.tintColor = primaryTintColor
        collectionView.refreshControl?.addTarget(self, action: #selector(handleRefreshLandmarks), for: .valueChanged)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 8
        let height = CGFloat(90)

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let landmarkDetail = LandmarkDetailViewController()
        guard let landmark = landmarks[indexPath.row] else {
            preconditionFailure("Unknown landmark tapped")
        }
        landmarkDetail.selectedLandmark = landmark
        self.present(landmarkDetail, animated: true, completion: nil)
    }

    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CustomCell
        cell?.isSelected = true
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landmarks.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CustomCell
        guard let landmark = landmarks[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell?.titleLabel.text = landmark.name

        cell?.descriptionLabel.text = getNextRainHumanDescription(nextRainEpoch: landmark.nextRainEpoch)
        if let temperature = landmark.weatherReports?.first?.temperature {
            cell?.temperatureLabel.text = "\(Int(temperature))°C"
        }
        if let weatherCode = landmark.weatherReports?.first?.tomorrowCode {
            cell?.iconView.image = UIImage(weatherCode: weatherCode)
            cell?.iconView.tintColor = .white
            cell?.iconView.translatesAutoresizingMaskIntoConstraints = false
        }

        return cell ?? UICollectionViewCell()

    }

    @objc func handleRefreshLandmarks() {
        self.collectionView.refreshControl?.beginRefreshing()
        networkManager.getLandmarksDetailed {
            [weak self] (newLandmarks) in
            DispatchQueue.main.async {
                self?.landmarks = newLandmarks
                self?.collectionView.reloadData()
                self?.collectionView.refreshControl?.endRefreshing()
            }
        }
    }

    func getNextRainHumanDescription(nextRainEpoch: Int) -> String {
        if nextRainEpoch < 1 {
            return "No upcoming rain"
        }

        let nextRainDate = Date(timeIntervalSince1970: Double(nextRainEpoch))
        let untilNextRain = Date().distance(to: nextRainDate)
        let formatter = RelativeDateTimeFormatter()
        let twentyHoursInSeconds = 60 * 60 * 20.0
        if untilNextRain < 1200 {
            return "Raining now"
        }
        if untilNextRain >= twentyHoursInSeconds {
            return "No upcoming rain"
        }
        formatter.dateTimeStyle = .named
        let str = formatter.localizedString(fromTimeInterval: untilNextRain)
        return "Rain: \(str)"
    }
}
