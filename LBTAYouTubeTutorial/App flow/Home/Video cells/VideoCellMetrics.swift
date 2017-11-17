//
//  ViewCellLayoutMetrics.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 19/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit

struct VideoCellMetrics {
    
    static func cellHeight(viewWidth: CGFloat) -> CGFloat {
        let thumbnailImageWidth = viewWidth - leftPadding - rightPadding
        let thumbnailImageHeight = thumbnailImageWidth * 9/16
        
        return topPadding
            + thumbnailImageHeight
            + spacingBelowVideoImage
            + titleLabelHeight
            + spacingBelowTitleLabel
            + subtitleTextViewHeight
            + bottomPadding
    }
    
    // MARK: - Cell padding
    static let leftPadding: CGFloat = 16
    static let rightPadding: CGFloat = 16
    static let topPadding: CGFloat = 16
    static let bottomPadding: CGFloat = 16
    
    // MARK: - Spacing
    static let spacingBelowVideoImage: CGFloat = 16
    static let spacingBelowTitleLabel: CGFloat = 4
    static let spacingRightUserProfileImage: CGFloat = 8
    
    // MARK: - Elements Dimensions
    static let thumbnailImageHeight: CGFloat = 200
    static let titleLabelHeight: CGFloat = 20
    static let subtitleTextViewHeight: CGFloat = 30
    static let userProfileImageSide: CGFloat = 44
    static let separatorLineHeight: CGFloat = 1
}
