//
//  PlaylistCollectionViewCell.swift
//  MeditationApp
//
//  Created by Buse Şahinbaş on 16.12.2024.
//

import UIKit

final class PlaylistCollectionViewCell: UICollectionViewCell {
    @IBOutlet private(set) weak var mainView: UIView!
    @IBOutlet private(set) weak var imageView: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var minView: UIView!
    @IBOutlet private(set) weak var minLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func setup() {
        imageView.layer.cornerRadius = 10
        mainView.layer.cornerRadius = 10
        minView.layer.cornerRadius = 5
    }
}
