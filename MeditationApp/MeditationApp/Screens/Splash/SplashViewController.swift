//
//  SplashViewController.swift
//  MeditationApp
//
//  Created by Edanur Yildirim, Vodafone on 17.11.2024.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet private weak var splashImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadImage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animateSplashImageView()
        }
    }
    
    private func uploadImage() {
        splashImageView.image = UIImage(named: Constants.Images.Splash.splashIcon)
    }
    
    private func animateSplashImageView() {
        UIView.animate(withDuration: 1.0, animations: {
            self.splashImageView.frame.origin.y -= self.splashImageView.frame.height
            self.splashImageView.alpha = 0
        }) { _ in
            self.navigateToMainViewController()
        }
    }
    
    private func navigateToMainViewController() {
        let onboardingVC = OnboardingViewController(nibName: "OnboardingViewController", bundle: nil)
        
        let navigationController = UINavigationController(rootViewController: onboardingVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
