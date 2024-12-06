//
//  OnboardingViewModel.swift
//  MeditationApp
//
//  Created by Buse Şahinbaş on 2.12.2024.
//

import Foundation

class OnboardingViewModel {
    private let dataProvider: DataProvider
   
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
    
    func getPages() -> [OnboardingPage] {
        return dataProvider.fetchOnboardingData()
    }
}
