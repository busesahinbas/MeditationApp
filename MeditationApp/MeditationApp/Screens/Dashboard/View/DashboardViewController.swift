//
//  DashboardViewController.swift
//  MeditationApp
//
//  Created by Buse Şahinbaş on 2.12.2024.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet private(set) weak var iconImage: UIImageView!
    @IBOutlet private(set) weak var profileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "FeelTableViewCell", bundle: nil), forCellReuseIdentifier: "FeelTableViewCell")
        tableView.register(UINib.init(nibName: "DailyTableViewCell", bundle: nil), forCellReuseIdentifier: "DailyTableViewCell")
        tableView.register(UINib.init(nibName: "PlaylistTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaylistTableViewCell")
        tableView.register(UINib.init(nibName: "ReadTableViewCell", bundle: nil), forCellReuseIdentifier: "ReadTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let feelCell = tableView.dequeueReusableCell(withIdentifier: "FeelTableViewCell", for: indexPath) as? FeelTableViewCell {
                return feelCell
            }
        case 1:
            if let readCell = tableView.dequeueReusableCell(withIdentifier: "ReadTableViewCell", for: indexPath) as? ReadTableViewCell {
                return readCell
            }
        case 2:
            if let playlistCell = tableView.dequeueReusableCell(withIdentifier: "PlaylistTableViewCell", for: indexPath) as? PlaylistTableViewCell {
                return playlistCell
            }
        case 3:
            if let dailyCell = tableView.dequeueReusableCell(withIdentifier: "DailyTableViewCell", for: indexPath) as? DailyTableViewCell {
                return dailyCell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row at \(indexPath.row)")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

