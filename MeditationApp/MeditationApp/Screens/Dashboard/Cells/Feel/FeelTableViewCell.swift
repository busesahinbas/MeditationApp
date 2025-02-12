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
        setupImageView()
        setupTapGestures()
    }
    
    func setupImageView() {
        firstImageView.layer.cornerRadius = 20
        secondImageView.layer.cornerRadius = 20
        thirdImageView.layer.cornerRadius = 20
        forthImageView.layer.cornerRadius = 20
    }
    
    private func setupTapGestures() {
        let views = [firstImageView, secondImageView, thirdImageView, forthImageView]
        
        views.forEach { view in
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
            view?.isUserInteractionEnabled = true
            view?.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc private func viewTapped(_ gesture: UITapGestureRecognizer) {
        guard let parentVC = parentViewController,
              let tappedView = gesture.view else { return }
        
        var message = "Your feedback has been received successfully."

        // Her view için farklı mesaj
        switch tappedView {
        case firstImageView:
            message = "Thank you for feeling calm!"
        case secondImageView:
            message = "Thank you for feeling relax!"
        case thirdImageView:
            message = "Thanks for feeling focus!"
        case forthImageView:
            message = "Thank you for feeling at anxious!"
        default:
            break
        }
        
        let alertController = UIAlertController(
            title: "Your feedback has been received successfully.",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Tamam", style: .default)
        alertController.addAction(okAction)
        
        parentVC.present(alertController, animated: true)
    }
}

extension UITableViewCell {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
