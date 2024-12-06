//
//  FeelTableViewCell.swift
//  MeditationApp
//
//  Created by Buse Şahinbaş on 6.12.2024.
//

import UIKit

class FeelTableViewCell: UITableViewCell {
    @IBOutlet weak var firstImageView: UIView!
    @IBOutlet weak var secondImageView: UIView!
    @IBOutlet weak var thirdImageView: UIView!
    @IBOutlet weak var forthImageView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupImageView()
    }
    
    
    func setupImageView() {
        firstImageView.layer.cornerRadius = 20
        secondImageView.layer.cornerRadius = 20
        thirdImageView.layer.cornerRadius = 20
        forthImageView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
