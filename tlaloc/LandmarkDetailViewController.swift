//
//  LandmarkDetailViewController.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 7/31/21.
//

import UIKit

class LandmarkDetailViewController: UITableViewController {
    let cellId = "hourlyTableCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(HourlyWeatherTableViewCell.self, forCellReuseIdentifier: cellId)

        view.backgroundColor = .black

        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 200))
        let titleLabel = UILabel()
        titleLabel.text = "Roma Norte"
        titleLabel.font = UIFont.systemFont(ofSize: 48)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let centigrades = UILabel()
        centigrades.text = "19°C"
        centigrades.font = UIFont.systemFont(ofSize: 24)
        centigrades.textColor = .white
        centigrades.translatesAutoresizingMaskIntoConstraints = false

        let rainDescriptor = UILabel()
        rainDescriptor.text = "It will rain in 3 hours"
        rainDescriptor.font = UIFont.systemFont(ofSize: 20)
        rainDescriptor.textColor = .white
        rainDescriptor.translatesAutoresizingMaskIntoConstraints = false

        let bigConfiguration = UIImage.SymbolConfiguration(scale: .large)
        let weatherIcon = UIImage(systemName: "cloud.sun.rain.fill", withConfiguration: bigConfiguration)
        let iconView = UIImageView(image: weatherIcon)
        iconView.tintColor = .white
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(titleLabel)
        headerView.addSubview(centigrades)
        headerView.addSubview(rainDescriptor)
        headerView.addSubview(iconView)

        titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 16).isActive = true

        rainDescriptor.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 16).isActive = true
        rainDescriptor.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true

        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: rainDescriptor.topAnchor),
            iconView.leftAnchor.constraint(equalTo: rainDescriptor.rightAnchor, constant: 16),
            centigrades.topAnchor.constraint(equalTo: rainDescriptor.bottomAnchor, constant: 16),
            centigrades.leftAnchor.constraint(equalTo: rainDescriptor.leftAnchor)
        ])

        tableView.tableHeaderView = headerView
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        24
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyTableCell", for: indexPath) as! HourlyWeatherTableViewCell
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell: \(indexPath.row)")
    }
}
