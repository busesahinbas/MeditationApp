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
        tableView.register(UINib.init(nibName: "ReadTableViewCell", bundle: nil), forCellReuseIdentifier: "ReadTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let feelCell = tableView.dequeueReusableCell(withIdentifier: "FeelTableViewCell", for: indexPath) as? FeelTableViewCell {
                return feelCell
            }
        }
        if indexPath.row == 1 {
            if let readCell = tableView.dequeueReusableCell(withIdentifier: "ReadTableViewCell", for: indexPath) as? ReadTableViewCell {
                return readCell
            }
        }
        if indexPath.row == 3 {
            if let dailyCell = tableView.dequeueReusableCell(withIdentifier: "DailyTableViewCell", for: indexPath) as? DailyTableViewCell {
                return dailyCell
            }
        }
        let defaultCell = UITableViewCell()
        defaultCell.textLabel?.text = "Row \(indexPath.row + 1)" // Example text
        return defaultCell
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

