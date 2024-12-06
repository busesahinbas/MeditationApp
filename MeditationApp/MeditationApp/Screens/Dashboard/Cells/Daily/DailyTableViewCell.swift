//
//  DailyTableViewCell.swift
//  MeditationApp
//
//  Created by Buse Şahinbaş on 6.12.2024.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        backgroundImage.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
