//
//  OnboardingViewController.swift
//  MeditationApp
//
//  Created by Buse Şahinbaş on 17.11.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var descriptionLabel: UILabel!
    @IBOutlet private(set) weak var nextButton: UIButton!
    @IBOutlet private(set) weak var imageView: UIImageView!
    @IBOutlet private(set) weak var pageControl: UIPageControl!

    private var pages: [OnboardingPage] = []
    private var currentPage = 0
    private let viewModel = OnboardingViewModel(dataProvider: DataProvider())

    override func viewDidLoad() {
        super.viewDidLoad()
        pages = viewModel.getPages()
        setup()
    }

    func setup() {
        setupPageControl()
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 10
    }

    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = currentPage
        updatePage()
    }

    func configure(with title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        if currentPage < pages.count - 1 {
            currentPage += 1
            updatePage()
        } else {
            navigateToMainApp()
        }
    }

    private func navigateToMainApp() {
        let dashboardVC = DashboardViewController(nibName: "DashboardViewController", bundle: nil)
        
        let navigationController = UINavigationController(rootViewController: dashboardVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
    private func updatePage() {
        let page = pages[currentPage]
        titleLabel.text = page.title
        descriptionLabel.text = page.description
        imageView.image = UIImage(named: page.imageName)

        if currentPage == pages.count - 1 {
            nextButton.setTitle("Get Started", for: .normal)
        } else {
            nextButton.setTitle("Next", for: .normal)
        }

        pageControl.currentPage = currentPage
    }
}
