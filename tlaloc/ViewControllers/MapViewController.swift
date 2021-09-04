//
//  MapViewController.swift
//  tlaloc
//
//  Created by Martin Granados Garcia on 9/4/21.
//

import UIKit

class MapViewController: UIViewController {
    
    override func viewDidLoad() {
        tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        tabBarController?.selectedIndex = 0

        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "mexicoMap")
        backgroundImageView.contentMode = UIView.ContentMode.scaleAspectFit
        self.view.addSubview(backgroundImageView)
    }
}
