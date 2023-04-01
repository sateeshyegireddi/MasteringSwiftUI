//
//  Chapter11View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 31/03/23.
//

import SwiftUI

struct Chapter11View: View {

    // CUSTOMIZE NAVIGATION BAR
    // We don't have any specific setup in SwiftUI to customize the navigation bar.
    // We have the plain UINavigationBar API to make the UI things up.

    init() {
        let navBarAppearance = UINavigationBarAppearance()

        // LARGE TITLE
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.systemRed,
            .font: UIFont(name: "GillSans-Bold", size: 35)!
        ]

        // SMALL TITLE
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.systemRed,
            .font: UIFont(name: "GillSans", size: 20)!
        ]

        // BACK BUTTON
        let image = UIImage(systemName: "arrow.turn.up.left")
        navBarAppearance.setBackIndicatorImage(image, transitionMaskImage: image)

        // Standard height of navigation bar - iPhone portait mode
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        // Compact height of navigation bar - iPhone landscape mode
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        // Edge of the scrolled content reached navigation bar
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance

        UINavigationBar.appearance().tintColor = .black
    }


    var body: some View {
        
        // SCREEN NAVIGATION WITH NavigationView

        NavigationView {
            List(Restaurant.list, id: \.id) { restaurant in
                let details = RestaurantDetailView(restaurant: restaurant)
                NavigationLink(destination: details) { // To push next screen 👈
                    BasicImageRow(restaurant: restaurant)
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("Restaurants")) // Set the bar title 👈
            .navigationBarTitleDisplayMode(.automatic) // Set the displayMode 👈
        }
    }
}

struct Chapter11View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter11View()
    }
}

struct RestaurantDetailView: View {
    @Environment(\.presentationMode) var mode
    var restaurant: Restaurant

    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Spacer()
        }
        // Hide Navigation Back Button 👈
        .navigationBarBackButtonHidden(true)
        // Configure Left & Right Navigation Bar Items 👈
        .navigationBarItems(
            leading: Button(action: {
                mode.wrappedValue.dismiss() // To go back to previous screen 👈
            }) {
                Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                    .foregroundColor(.red)
            }
        )
    }
}
