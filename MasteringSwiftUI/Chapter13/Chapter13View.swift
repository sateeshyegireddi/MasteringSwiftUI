//
//  Chapter13View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 02/04/23.
//

import SwiftUI

struct Chapter13View: View {
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack {
            List(Restaurant.list) { restaurant in
                RestaurantRowView(restaurant: restaurant)
            }
            .listStyle(.plain)
            .navigationTitle("Restaurants")
            .navigationBarItems(
                trailing: Button(action: {
                    showSettings = true
                }, label: {
                    Image(systemName: "gear")
                        .font(.title2)
                        .foregroundColor(.black)
                })
            )
            .sheet(isPresented: $showSettings) {
                RestaurantSettingsView()
            }
        }
    }
}

struct Chapter13View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter13View()
    }
}
