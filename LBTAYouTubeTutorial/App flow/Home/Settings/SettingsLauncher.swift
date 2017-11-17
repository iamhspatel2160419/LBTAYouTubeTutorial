//
//  SettingsLauncher.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 21/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject {
    
    let backgroundBlackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.alpha = 0
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    func openSettings() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        backgroundBlackView.frame = window.frame
        backgroundBlackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissSettings)))
        window.addSubview(backgroundBlackView)
        
        window.addSubview(collectionView)
        let collectionViewHeight: CGFloat = 200
        let initialYPosition = window.frame.height
        collectionView.frame = CGRect(x: 0, y: initialYPosition, width: window.frame.width, height: collectionViewHeight)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.backgroundBlackView.alpha = 1
            
            let yPosition = window.frame.height - self.collectionView.frame.height
            self.collectionView.frame = CGRect(x: 0, y: yPosition, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
        })
    }
    
    @objc private func handleDismissSettings() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.backgroundBlackView.alpha = 0
            
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            let initialYPosition = window.frame.height
            self.collectionView.frame = CGRect(x: 0, y: initialYPosition, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
        })
    }
}
