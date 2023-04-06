//
//  RestaurantRowView.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 02/04/23.
//

import SwiftUI

struct RestaurantRowView: View {
    var restaurant: Restaurant

    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 60)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                HStack {
                    Text(restaurant.name)
                        .font(.system(.body, design: .rounded, weight: .bold))
                    HStack(spacing: 0) {
                        ForEach(0..<restaurant.priceLevel, id: \.self) { _ in
                            Text("$")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(0)
                        }
                    }
                }
                Text(restaurant.type)
                    .font(.system(.subheadline, design: .rounded, weight: .bold))
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                Text(restaurant.phone)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
            }
            Spacer()
                .layoutPriority(-100)
            if restaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }
            if restaurant.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RestaurantRowView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantRowView(restaurant: Restaurant.list[2])
    }
}
