//
//  DataProvider.swift
//  MeditationApp
//
//  Created by Buse Şahinbaş on 2.12.2024.
//

import Foundation
import UIKit

class DataProvider {
    func fetchOnboardingData() -> [OnboardingPage] {
        return [
            OnboardingPage(title: "Welcome", description: "Discover new ways to meditate.", imageName: Constants.ImageNames.Onboarding.firstImage),
            OnboardingPage(title: "Relax", description: "Find peace and balance in life.", imageName: Constants.ImageNames.Onboarding.secondImage),
            OnboardingPage(title: "Focus", description: "Stay sharp and productive.", imageName: Constants.ImageNames.Onboarding.thirdImage)
        ]
    }
}
