//
//  ViewController.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 19/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
    
    let menuBar: MenuBar = {
        let menuBar = MenuBar()
        return menuBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        registerCells()
    }
    
    private func setupViews() {
        collectionView?.backgroundColor = .white
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupNavigationBar()
        setupMenuBar()
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        menuBar.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 20, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        let searchIcon = #imageLiteral(resourceName: "search_icon").withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: #selector(handleSearch))
        
        let settingsIcon = #imageLiteral(resourceName: "nav_more_icon").withRenderingMode(.alwaysOriginal)
        let settingsBarButtonItem = UIBarButtonItem(image: settingsIcon, style: .plain, target: self, action: #selector(handleOpenSettings))
        
        navigationItem.rightBarButtonItems = [settingsBarButtonItem, searchBarButtonItem]
    }
    
    private func registerCells() {
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: VideoCell.reuseIdentifier)
    }
    
    @objc private func handleSearch() {
        
    }
    
    let settingsLauncher = SettingsLauncher()
    
    @objc private func handleOpenSettings() {
        settingsLauncher.openSettings()
    }
}

extension HomeController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCell.reuseIdentifier, for: indexPath)
        return cell
    }
    
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = VideoCellMetrics.cellHeight(viewWidth: view.frame.width)
        return CGSize(width: view.frame.width, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        collectionView?.collectionViewLayout.invalidateLayout()
        view.setNeedsDisplay()
    }
}
