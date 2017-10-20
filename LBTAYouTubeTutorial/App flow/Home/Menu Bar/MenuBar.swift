//
//  MenuBar.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 20/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit
class MenuBar: UIView {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    let menuImages = [#imageLiteral(resourceName: "menu_home"), #imageLiteral(resourceName: "menu_trending"), #imageLiteral(resourceName: "menu_subscriptions"), #imageLiteral(resourceName: "menu_account")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        setupViews()
    }
    
    private func setupCollectionView() {
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.reuseIdentifier)
        let defaultIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: defaultIndexPath, animated: false, scrollPosition: [])
    }
    
    private func setupViews() {
        backgroundColor = .redNavigationBar
        addSubview(collectionView)
        collectionView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.reuseIdentifier, for: indexPath) as! MenuCell
        cell.setup(withImage: menuImages[indexPath.item])
        if indexPath.item == 0 {
            cell.isSelected = true
        }
        
        return cell
    }
}

extension MenuBar: UICollectionViewDelegate {
    
}

extension MenuBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
