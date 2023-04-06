//
//  Restaurant.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 31/03/23.
//

import Foundation

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var type: String
    var phone: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}

extension Restaurant {
    static var list: [Restaurant] {
        let restaurants = [
            Restaurant(name: "Cafe Deadend", image: "cafedeadend", type: "Coffee & Tea Shop", phone: "232-923423", priceLevel: 3),
            Restaurant(name: "Homei", image: "homei", type: "Cafe", phone: "348-233423", priceLevel: 3),
            Restaurant(name: "Teakha", image: "teakha", type: "Tea House", phone: "354-243523", priceLevel: 3, isFavorite: true, isCheckIn: true),
            Restaurant(name: "Cafe loisl", image: "cafeloisl", type: "Austrian / Casual Drink", phone: "453-333423", priceLevel: 2, isFavorite: true, isCheckIn: true),
            Restaurant(name: "Petite Oyster", image: "petiteoyster", type: "French", phone: "983-284334", priceLevel: 5, isCheckIn: true),
            Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant", type: "Hong Kong", phone: "232-434222", priceLevel: 2, isFavorite: true, isCheckIn: true),
            Restaurant(name: "Po's Atelier", image: "posatelier", type: "Bakery", phone: "234-834322", priceLevel: 4),
            Restaurant(name: "Bourke Street Backery", image: "bourkestreetbakery", type: "Chocolate", phone: "982-434343", priceLevel: 4, isCheckIn: true),
            Restaurant(name: "Haigh's Chocolate", image: "haighschocolate", type: "Cafe", phone: "734-232323", priceLevel: 3, isFavorite: true),
            Restaurant(name: "Palomino Espresso", image: "palominoespresso", type: "American / Seafood", phone: "872-734343", priceLevel: 2),
            Restaurant(name: "Upstate", image: "upstate", type: "Seafood", phone: "343-233221", priceLevel: 4),
            Restaurant(name: "Traif", image: "traif", type: "American", phone: "985-723623", priceLevel: 5),
            Restaurant(name: "Graham Avenue Meats", image: "grahamavenuemeats", type: "Breakfast & Brunch", phone: "455-232345", priceLevel: 3),
            Restaurant(name: "Waffle & Wolf", image: "wafflewolf", type: "Coffee & Tea", phone: "434-232322", priceLevel: 3),
            Restaurant(name: "Five Leaves", image: "fiveleaves", type: "Bistro", phone: "343-234553", priceLevel: 4, isFavorite: true, isCheckIn: true),
            Restaurant(name: "Cafe Lore", image: "cafelore", type: "Latin American", phone: "342-455433", priceLevel: 2, isFavorite: true, isCheckIn: true),
            Restaurant(name: "Confessional", image: "confessional", type: "Spanish", phone: "643-332323", priceLevel: 4),
            Restaurant(name: "Barrafina", image: "barrafina", type: "Spanish", phone: "542-343434", priceLevel: 2, isCheckIn: true),
            Restaurant(name: "Donostia", image: "donostia", type: "Spanish", phone: "722-232323", priceLevel: 1),
            Restaurant(name: "Royal Oak", image: "royaloak", type: "British", phone: "343-988834", priceLevel: 2, isFavorite: true),
            Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen", type: "Thai", phone: "432-344050", priceLevel: 1)
        ]
        return restaurants
    }
}
