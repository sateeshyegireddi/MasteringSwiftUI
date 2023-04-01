//
//  Chapter10View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 29/03/23.
//

import SwiftUI

struct Chapter10View: View {

    var body: some View {
        
        // SIMPLE LIST

//        List {
//            Text("Item 1")
//            Text("Item 2")
//            Text("Item 3")
//            Text("Item 4")
//        }
        
//        List {
//            ForEach(1..<5, id: \.self) {
//                Text("Item \($0)")
//            }
//        }
        
        // LIST WITH DATA

        // Note: We've used 'indices' instead of half-open range 👈
        List(Restaurant.list.indices, id: \.self) { index in
            let restaurant = Restaurant.list[index]
            if (0...1).contains(index) {
                FullImageRow(restaurant: restaurant)
            } else {
                BasicImageRow(restaurant: restaurant)
            }
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)
    }
}

struct Chapter10View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter10View()
    }
}

struct BasicImageRow: View {
    var restaurant: Restaurant

    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(4)
            Text(restaurant.name)
        }
    }
}

struct FullImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .opacity(0.2)
                }
            Text(restaurant.name)
                .font(.system(.title, design: .rounded, weight: .bold))
                .foregroundColor(.white)
        }
    }
}
