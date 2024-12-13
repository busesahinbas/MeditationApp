//
//  ReadCollectionViewCell.swift
//  MeditationApp
//
//  Created by Edanur Yildirim, Vodafone on 7.12.2024.
//

import UIKit

class ReadCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var readInfoLabel: UILabel!
    @IBOutlet private weak var infoBadgeButton: UIButton!
    @IBOutlet private weak var readImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    func configure() {
        
    }
    
    private func setUpView() {
        readInfoLabel.text = "Let’s create find your mood and create your own genarated mediation!"
        infoBadgeButton.setTitle("Selectable min", for: .normal)
        readImageView.image = UIImage(named: Constants.Images.Read.readImage)
    }
}
