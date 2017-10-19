//
//  UICollectionViewCell+Extensions.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 19/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
