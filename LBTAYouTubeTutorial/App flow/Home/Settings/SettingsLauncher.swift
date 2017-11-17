//
//  SettingsLauncher.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 21/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit

struct Setting {
    let name: String
    let image: UIImage
}

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
    
    let cellHeight: CGFloat = 50
    
    let settings = [
        Setting(name: "Settings", image: #imageLiteral(resourceName: "settings")),
        Setting(name: "Terms & Privacy Policy", image: #imageLiteral(resourceName: "privacy")),
        Setting(name: "Send Feedback", image: #imageLiteral(resourceName: "feedback")),
        Setting(name: "Help", image: #imageLiteral(resourceName: "help")),
        Setting(name: "Switch Account", image: #imageLiteral(resourceName: "switch_account")),
        Setting(name: "Cancel", image: #imageLiteral(resourceName: "cancel"))
    ]
    
    func openSettings() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        backgroundBlackView.frame = window.frame
        backgroundBlackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissSettings)))
        window.addSubview(backgroundBlackView)
        
        window.addSubview(collectionView)
        let collectionViewHeight: CGFloat = CGFloat(settings.count) * cellHeight
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
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SettingsCell.self, forCellWithReuseIdentifier: SettingsCell.reuseIdentifier)
    }
}

extension SettingsLauncher: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsCell.reuseIdentifier, for: indexPath) as! SettingsCell
        let setting = settings[indexPath.item]
        cell.setting = setting // PS: To refactor. Cell shouldn't be aware of Model
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
}


extension SettingsLauncher: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
}

extension SettingsLauncher: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
