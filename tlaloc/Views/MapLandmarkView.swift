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
        rainLabel.text = "RAIN IN 5h"
        rainLabel.textColor = .white
        let rainFont = UIFont.systemFont(ofSize: 13).addingUpperCaseSmallCaps
        rainLabel.font = rainFont
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

extension UIFont {
    func addingAttributes(_ attributes: [UIFontDescriptor.AttributeName : Any] = [:]) -> UIFont {
       return UIFont(descriptor: fontDescriptor.addingAttributes(attributes), size: pointSize)
   }

   /// Returns a UIFont object based on the receiver with small caps applied to upper case letters
   var addingUpperCaseSmallCaps: UIFont {
       return addingAttributes([
        UIFontDescriptor.AttributeName.featureSettings: [
               [
                UIFontDescriptor.FeatureKey.featureIdentifier: kUpperCaseType,
                UIFontDescriptor.FeatureKey.typeIdentifier: kUpperCaseSmallCapsSelector
               ]
           ]
       ])
   }
}
