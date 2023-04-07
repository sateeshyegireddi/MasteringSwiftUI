//
//  SettingsStore.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 06/04/23.
//

import Foundation

class SettingsStore: ObservableObject {
    private static let displayOrderKey = "view.preferences.displayOrder"
    private static let showCheckInOnlyKey = "view.preferences.showCheckInOnly"
    private static let maxPriceLevelKey = "view.preferences.maxPriceLevel"

    init() {
        UserDefaults.standard.register(defaults: [
            Self.displayOrderKey: 0,
            Self.showCheckInOnlyKey: false,
            Self.maxPriceLevelKey: 5
        ])
    }
    
    @Published var displayOrder: DisplayOrderType = DisplayOrderType(
        type: UserDefaults.standard.integer(forKey: SettingsStore.displayOrderKey)
    ) {
        didSet {
            UserDefaults.standard.set(displayOrder.rawValue, forKey: SettingsStore.displayOrderKey)
        }
    }

    @Published var showCheckInOnly: Bool = UserDefaults.standard.bool(forKey: SettingsStore.showCheckInOnlyKey) {
        didSet {
            UserDefaults.standard.set(showCheckInOnly, forKey: SettingsStore.showCheckInOnlyKey)
        }
    }

    @Published var maxPriceLevel: Int = UserDefaults.standard.integer(forKey: SettingsStore.maxPriceLevelKey) {
        didSet {
            UserDefaults.standard.set(maxPriceLevel, forKey: SettingsStore.maxPriceLevelKey)
        }
    }
}
