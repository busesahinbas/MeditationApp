//
//  ReadTableViewCell.swift
//  MeditationApp
//
//  Created by Edanur Yildirim, Vodafone on 7.12.2024.
//

import UIKit

class ReadTableViewCell: UITableViewCell {
    @IBOutlet private weak var pageTitleLabel: UILabel!
    @IBOutlet private weak var readCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionViewLayout()
    }
    
    func configure() {
       
    }
    
    // MARK: - Collection View Setup
    private func setUpCollectionViewLayout() {
        readCollectionView.delegate = self
        readCollectionView.dataSource = self
        configureCollectionViewFlowLayout()
        registerCollectionViewCell()
    }
    
    private func configureCollectionViewFlowLayout() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.scrollDirection = .horizontal
        readCollectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
    }
    
    private func registerCollectionViewCell() {
        readCollectionView.register(UINib.init(nibName: "ReadCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReadCollectionViewCell")
    }
}

extension ReadTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: ReadCollectionViewCell = readCollectionView.dequeueReusableCell(withReuseIdentifier: "ReadCollectionViewCell", for: indexPath) as? ReadCollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }

}

extension ReadTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: readCollectionView.frame.width - 10, height: 135)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 50)
    }
}
