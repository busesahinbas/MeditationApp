//
//  HeaderTableViewCell.swift
//  MeditationApp
//
//  Created by Edanur Yildirim, Vodafone on 17.11.2024.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var headTitleLabel: UILabel!
  
    func configureUI() {
        appImageView.image = UIImage(named: Constants.Images.Splash.splashIcon)
        headTitleLabel.text = "Information"
    }

}
