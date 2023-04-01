//
//  Chapter4ExcerciseView.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi, Sateesh on 29/01/23.
//

import SwiftUI

struct Chapter4ExcerciseView: View {
    var body: some View {
        VStack(spacing: -40) {
            PriceView(
                icon: "wand.and.rays", title: "Team", price: "$299",
                bgColor: .init(red: 62/255, green: 63/255, blue: 70/255))
            .zIndex(2)
            .scaleEffect(0.9)
            PriceView(icon: "wand.and.rays", title: "Team", price: "$299",
                      bgColor: .init(red: 255/255, green: 183/255, blue: 37/255))
            .zIndex(1)
            .scaleEffect(0.95)
            PriceView(icon: "wand.and.rays", title: "Team", price: "$299",
                      bgColor: .purple)
        }
        .padding(.horizontal)
    }
}

struct PriceView: View {
    var icon: String
    var title: String
    var price: String
    var bgColor: Color

    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.white)
            Text(title)
                .fontWeight(.black)
                .font(.system(.title, design: .rounded))
                .foregroundColor(.white)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
            Text("per month")
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}

struct Chapter4ExcerciseView_Previews: PreviewProvider {
    static var previews: some View {
        Chapter4ExcerciseView()
    }
}
