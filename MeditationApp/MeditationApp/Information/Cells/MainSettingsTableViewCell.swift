//
//  MainSettingsTableViewCell.swift
//  MeditationApp
//
//  Created by Edanur Yildirim, Vodafone on 24.11.2024.
//

import UIKit

class MainSettingsTableViewCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var settingsFirstIconImageView: UIImageView!
    @IBOutlet private weak var settingsFirstTitleLabel: UILabel!
    @IBOutlet private weak var settingsFirstDescriptionLabel: UILabel!
    @IBOutlet private weak var settingsSecondIconImageView: UIImageView!
    @IBOutlet private weak var settingsSecondTitleLabel: UILabel!
    @IBOutlet private weak var settingsSecondDescriptionLabel: UILabel!
    @IBOutlet private weak var appVersionNumberLabel: UILabel!
    
    func configureUI() {
        containerView.alpha = 0.7
        settingsFirstTitleLabel.text = "Help"
        settingsFirstDescriptionLabel.text = "Help centre, contact us, privacy policy"
        settingsFirstIconImageView.image = UIImage(named: "help_icon")
        settingsSecondTitleLabel.text = "Vote"
        settingsSecondDescriptionLabel.text = "share your comment"
        settingsSecondIconImageView.image = UIImage(named: "vote_icon")
        showAppVersion()
    }
    
    private func showAppVersion() {
        let appVersion = Bundle.main.appShortVersion
        let versionText = "version "
        appVersionNumberLabel.text = versionText + appVersion
    }
}
