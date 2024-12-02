//
//  DataProvider.swift
//  MeditationApp
//
//  Created by Buse Şahinbaş on 2.12.2024.
//

import Foundation

class DataProvider {
    func fetchOnboardingData() -> [OnboardingPage] {
        return [
            OnboardingPage(title: "Welcome", description: "Discover new ways to meditate."),
            OnboardingPage(title: "Relax", description: "Find peace and balance in life."),
            OnboardingPage(title: "Focus", description: "Stay sharp and productive.")
        ]
    }
}
