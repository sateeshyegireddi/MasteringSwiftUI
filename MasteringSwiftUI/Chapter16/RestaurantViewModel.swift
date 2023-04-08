//
//  RestaurantViewModel.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 08/04/23.
//

import Foundation

class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant]
    @Published var showActionSheet = false

    init() {
        self.restaurants = Restaurant.list
    }
    
    func remove(at offsets: IndexSet) {
        self.restaurants.remove(atOffsets: offsets)
    }
    
    func delete(_ restaurant: Restaurant) {
        if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            restaurants.remove(at: index)
        }
    }
    
    func setFavorite(_ restaurant: Restaurant) {
        if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            restaurants[index].isFavorite.toggle()
        }
    }
}
