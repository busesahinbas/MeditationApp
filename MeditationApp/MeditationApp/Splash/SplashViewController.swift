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
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.animateSplashImageView()
        }
    }
    
    private func uploadImage() {
        splashImageView.image = UIImage(named: MeditationConstant.Image.splashIcon)
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
        let mainVC = ViewController()
        
        if let window = view.window {
            window.rootViewController = mainVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
