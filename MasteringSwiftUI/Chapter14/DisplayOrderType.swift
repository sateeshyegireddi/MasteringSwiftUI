//
//  DisplayOrderType.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 06/04/23.
//

import Foundation

enum DisplayOrderType: Int, CaseIterable {
    case alphabetic = 0
    case favoriteFirst
    case checkInFirst

    init(type: Int) {
        switch type {
        case 0: self = .alphabetic
        case 1: self = .favoriteFirst
        case 2: self = .checkInFirst
        default: self = .alphabetic
        }
    }

    var text: String {
        switch self {
        case .alphabetic: return "Alphabetical"
        case .favoriteFirst: return "Show Favorite First"
        case .checkInFirst: return "Show Check-in First"
        }
    }

    func predicate() -> ((Restaurant, Restaurant) -> Bool) {
        switch self {
        case .alphabetic: return { $0.name < $1.name }
        case .favoriteFirst: return { $0.isFavorite && !$1.isFavorite }
        case .checkInFirst: return { $0.isCheckIn && !$1.isCheckIn }
        }
    }
}
