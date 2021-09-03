//
//  ViewController.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 7/26/21.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    public let cellId: String = "cellId"
    var weatherStore: WeatherStore? = nil
    var networkManager = NetworkManager()
    var landmarks: [Landmark?] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: cellId)

        networkManager.getLandmarksDetailed {
            [weak self] (newLandmarks) in
            DispatchQueue.main.async {
                self?.landmarks = newLandmarks
                self?.collectionView.reloadData()
            }
        }

        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.tintColor = UIColor.red
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

        let humanDescription = landmark.description.humanIntervalFromDescription()
        cell?.descriptionLabel.text = "\(humanDescription ?? "Honestly, don't know.")"
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
}
