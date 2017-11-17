//
//  SettingsCell.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 18/11/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit

class SettingsCell: BaseCell {
    
    var setting: Setting? {
        didSet {
            iconImageView.image = setting?.image.withRenderingMode(.alwaysTemplate)
            nameLabel.text = setting?.name
            iconImageView.tintColor = .darkGray
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .darkGray : .white
            nameLabel.textColor = isHighlighted ? .white : .black
            iconImageView.tintColor = isHighlighted ? .white : .darkGray
        }
    }
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override func setupViews() {
        addSubview(nameLabel)
        addSubview(iconImageView)
        iconImageView.anchor(nil, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        iconImageView.anchorCenterYToSuperview()
        nameLabel.anchor(topAnchor, left: iconImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
