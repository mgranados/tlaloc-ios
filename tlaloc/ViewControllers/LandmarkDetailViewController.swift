//
//  LandmarkDetailViewController.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 7/31/21.
//

import UIKit

class LandmarkDetailViewController: UITableViewController {
    let cellId = "hourlyTableCell"
    var selectedLandmark: Landmark? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(HourlyWeatherTableViewCell.self, forCellReuseIdentifier: cellId)

        view.backgroundColor = .black

        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 200))
        let titleLabel = UILabel()
        titleLabel.text = selectedLandmark?.name
        titleLabel.font = UIFont.systemFont(ofSize: 34)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let centigrades = UILabel()
        if let temperature = selectedLandmark?.weatherReports?.first?.temperature {
            centigrades.text = "\(Int(temperature))°C"
        }
        centigrades.font = UIFont.systemFont(ofSize: 22)
        centigrades.textColor = .white
        centigrades.translatesAutoresizingMaskIntoConstraints = false

        let rainDescriptor = UILabel()
        if let description = selectedLandmark?.description {
            let humanDescription = description.humanIntervalFromDescription()
            rainDescriptor.text = humanDescription
        }
        rainDescriptor.font = UIFont.systemFont(ofSize: 20)
        rainDescriptor.textColor = .white
        rainDescriptor.translatesAutoresizingMaskIntoConstraints = false

        var iconView = UIImageView()
        let nowDescription = UILabel()
        if let weatherCode = selectedLandmark?.weatherReports?.first?.tomorrowCode {
            nowDescription.text = "\(weatherCode.toWeatherDescription()) now."
            iconView = getWeatherIcon(weatherCode: weatherCode)
        }
        nowDescription.font = UIFont.systemFont(ofSize: 22)
        nowDescription.textColor = .white
        nowDescription.translatesAutoresizingMaskIntoConstraints = false

        headerView.addSubview(titleLabel)
        headerView.addSubview(centigrades)
        headerView.addSubview(rainDescriptor)
        headerView.addSubview(iconView)
        headerView.addSubview(nowDescription)

        titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true

        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            iconView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            nowDescription.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            nowDescription.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 8),
            centigrades.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            centigrades.leadingAnchor.constraint(equalTo: nowDescription.trailingAnchor, constant: 8),
            rainDescriptor.topAnchor.constraint(equalTo: nowDescription.bottomAnchor, constant: 16),
            rainDescriptor.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16)
        ])

        tableView.tableHeaderView = headerView
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedLandmark?.weatherReports?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyTableCell", for: indexPath) as! HourlyWeatherTableViewCell
        let weatherReport = selectedLandmark?.weatherReports?[indexPath.row]
        if let temperature = weatherReport?.temperature {
            cell.degreesLabel.text = "\(Int(temperature))°C"
        }
        if let weatherCode = weatherReport?.tomorrowCode {
            cell.iconView.image = UIImage(weatherCode: weatherCode)
            cell.iconView.tintColor = .white
            cell.iconView.translatesAutoresizingMaskIntoConstraints = false

            cell.rainDescriptionLabel.text = weatherCode.toWeatherDescription()
        }
        cell.hourLabel.text = weatherReport?.time.humanDateTime()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell: \(indexPath.row)")
    }

    func getWeatherIcon(weatherCode: Int) -> UIImageView {
        let weatherIcon = UIImage(weatherCode: weatherCode)
        let iconView = UIImageView(image: weatherIcon)
        iconView.tintColor = .white
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }
}
