//
//  ReadDetailViewController.swift
//  MeditationApp
//
//  Created by Edanur Yildirim, Vodafone on 25.12.2024.
//

import UIKit

class ReadDetailViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet private weak var headerImageView: UIImageView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var bookImageView: UIImageView!
    @IBOutlet private weak var readTimeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var darkModeButton: UIButton!
    @IBOutlet private weak var meditationStoryLabel: UILabel!

    private var isDarkMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateAppearance()
    }

    private func setupUI() {
        headerImageView.image = UIImage(named: Constants.Images.Read.readImage)
        dateLabel.text = "17 Ocak 2024"
        readTimeLabel.text = "6 dk"
        titleLabel.text = "Mediate to the Sounds of Nature"
        meditationStoryLabel.text = "Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!enarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!enarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and createLet's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!enarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!enarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create your own genarated mediation!Let's create find your mood and create"
        bookImageView.image = UIImage(systemName: "book.pages")
        darkModeButton.setImage(UIImage(systemName: "moon"), for: .normal)
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)

        let overlayView = UIView()
        overlayView.backgroundColor = .black.withAlphaComponent(0.6)
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.addSubview(overlayView)

        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: headerImageView.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: headerImageView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor)
        ])
    }

    @IBAction private func darkModeButtonTapped(_ sender: UIButton) {
        isDarkMode.toggle()
        updateAppearance()
    }

    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }

    private func updateAppearance() {
        view.backgroundColor = isDarkMode ? .black : .white
        contentView.backgroundColor = isDarkMode ? .black : .white

        meditationStoryLabel.textColor = isDarkMode ? .white : .black

        let buttonColor = isDarkMode ? UIColor.white : UIColor.white
        darkModeButton.tintColor = buttonColor

        let darkModeImage = isDarkMode ? UIImage(systemName: "sun.max.fill") : UIImage(systemName: "moon.fill")
        darkModeButton.setImage(darkModeImage, for: .normal)
    }
}
