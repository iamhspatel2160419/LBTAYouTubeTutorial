//
//  BaseCell.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 20/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
