//
//  VideoCell.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 19/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit
import LBTAComponents

class VideoCell: BaseCell {
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "taylor_swift")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "taylor_swift_profile")
        imageView.contentMode = .scaleAspectFill
        let cornerRadius = VideoCellMetrics.userProfileImageSide / 2
        imageView.layer.cornerRadius = cornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift - Blank Space"
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago"
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = .lightGray
        textView.isEditable = false
        return textView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .graySeparatorLine
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(thumbnailImageView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        addSubview(separatorView)
        
        let metrics = VideoCellMetrics.self
        
        thumbnailImageView.anchor(topAnchor,
                                  left: leftAnchor,
                                  bottom: nil,
                                  right: rightAnchor,
                                  topConstant: metrics.topPadding,
                                  leftConstant: metrics.leftPadding,
                                  bottomConstant: 0,
                                  rightConstant: metrics.rightPadding,
                                  widthConstant: 0,
                                  heightConstant: metrics.thumbnailImageHeight)
        
        userProfileImageView.anchor(thumbnailImageView.bottomAnchor,
                                    left: leftAnchor,
                                    bottom: nil,
                                    right: nil,
                                    topConstant: metrics.spacingBelowVideoImage,
                                    leftConstant: metrics.leftPadding,
                                    bottomConstant: 0,
                                    rightConstant: 0,
                                    widthConstant: metrics.userProfileImageSide,
                                    heightConstant: metrics.userProfileImageSide)
        
        titleLabel.anchor(userProfileImageView.topAnchor,
                          left: userProfileImageView.rightAnchor,
                          bottom: nil,
                          right: rightAnchor,
                          topConstant: 0,
                          leftConstant: metrics.spacingRightUserProfileImage,
                          bottomConstant: 0,
                          rightConstant: metrics.rightPadding,
                          widthConstant: 0,
                          heightConstant: metrics.titleLabelHeight)
        
        subtitleTextView.anchor(titleLabel.bottomAnchor,
                          left: titleLabel.leftAnchor,
                          bottom: nil,
                          right: rightAnchor,
                          topConstant: metrics.spacingBelowTitleLabel,
                          leftConstant: 0,
                          bottomConstant: 0,
                          rightConstant: metrics.rightPadding,
                          widthConstant: 0,
                          heightConstant: metrics.subtitleTextViewHeight)
        
        separatorView.anchor(nil,
                             left: leftAnchor,
                             bottom: bottomAnchor,
                             right: rightAnchor,
                             topConstant: 0,
                             leftConstant: 0,
                             bottomConstant: 0,
                             rightConstant: 0,
                             widthConstant: 0,
                             heightConstant: metrics.separatorLineHeight)
    }
}
