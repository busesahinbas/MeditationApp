//
//  ReadCollectionViewCell.swift
//  MeditationApp
//
//  Created by Edanur Yildirim, Vodafone on 7.12.2024.
//

import UIKit

final class ReadCollectionViewCell: UICollectionViewCell {
    @IBOutlet private(set) weak var readInfoLabel: UILabel!
    @IBOutlet private(set) weak var readImageView: UIImageView!
    @IBOutlet private(set) weak var minView: UIView!
    @IBOutlet private(set) weak var minLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    func configure() {
        
    }
    
    private func setUpView() {
        readInfoLabel.text = "Let’s create find your mood and create your own genarated mediation!"
        readImageView.image = UIImage(named: Constants.Images.Read.readImage)
        minView.layer.cornerRadius = 5
    }
}
