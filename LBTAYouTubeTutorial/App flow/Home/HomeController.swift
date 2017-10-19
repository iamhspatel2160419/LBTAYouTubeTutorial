//
//  ViewController.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 19/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        registerCells()
    }
    
    private func setupViews() {
        navigationItem.title = "Home"
    }
    
    private func registerCells() {
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: VideoCell.reuseIdentifier)
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
        self.view.setNeedsDisplay()
    }
}
