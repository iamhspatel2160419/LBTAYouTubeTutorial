//
//  MenuCell.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 20/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? .white : .darkRedMenuItemUnselected
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? .white : .darkRedMenuItemUnselected
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        imageView.anchor(nil, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 28, heightConstant: 28)
        imageView.anchorCenterSuperview()
    }
    
    func setup(withImage image: UIImage) {
        imageView.image = image.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .darkRedMenuItemUnselected
    }
}
