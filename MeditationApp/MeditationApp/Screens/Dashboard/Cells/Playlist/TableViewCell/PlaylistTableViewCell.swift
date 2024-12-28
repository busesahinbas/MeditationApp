//
//  PlaylistTableViewCell.swift
//  MeditationApp
//
//  Created by Buse Şahinbaş on 16.12.2024.
//

import UIKit

protocol PlaylistTableViewCellDelegate: AnyObject {
    func didSelectItem(at indexPath: IndexPath)
}

final class PlaylistTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var collectionView: UICollectionView!
    
    weak var delegate: PlaylistTableViewCellDelegate?
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionViewLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Setup Methods
    private func setUpCollectionViewLayout() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(
            UINib(nibName: "PlaylistCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "PlaylistCollectionViewCell"
        )
        configureCollectionViewFlowLayout()
    }
    
    private func configureCollectionViewFlowLayout() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        collectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
    }
}

// MARK: - UICollectionView Delegate & DataSource
extension PlaylistTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Hücre sayısını döndürür
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "PlaylistCollectionViewCell",
            for: indexPath
        ) as? PlaylistCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(at: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PlaylistTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 153, height: 216)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
    }
}
