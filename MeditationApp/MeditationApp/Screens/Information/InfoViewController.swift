//
//  InfoViewController.swift
//  MeditationApp
//
//  Created by Edanur Yildirim, Vodafone on 17.11.2024.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var infoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpContainerTableView()
        registerCells()
    }
    
    private func setUpContainerTableView() {
        backgroundImageView.image = UIImage(named: "background")
        infoTableView.separatorColor = UIColor.clear
        infoTableView.contentInset = UIEdgeInsets.zero
        infoTableView.contentInsetAdjustmentBehavior = .never
    }
    
    private func registerCells() {
        infoTableView.register(UINib.init(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        infoTableView.register(UINib.init(nibName: "MainSettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "MainSettingsTableViewCell")
    }
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.row == 0 {
                if let headerCell = infoTableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as? HeaderTableViewCell {
                    headerCell.configureUI()
                    return headerCell
                }
            } else {
                if let settingsCell = infoTableView.dequeueReusableCell(withIdentifier: "MainSettingsTableViewCell", for: indexPath) as? MainSettingsTableViewCell {
                    settingsCell.configureUI()
                    return settingsCell
                }
            }
            return UITableViewCell()
        }
    }
