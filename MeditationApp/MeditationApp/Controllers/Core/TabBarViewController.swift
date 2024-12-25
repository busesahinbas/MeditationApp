//
//  TabBarViewController.swift
//  MeditationApp
//
//  Created by Edanur Yildirim, Vodafone on 13.12.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dashboardVC = DashboardViewController()
        let infoVC = InfoViewController()
        
        dashboardVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 1)
        infoVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "gearshape.fill"), tag: 1)
        
        setViewControllers([dashboardVC, infoVC], animated: false)
    }
}

