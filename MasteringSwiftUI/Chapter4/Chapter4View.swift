//
//  Chapter4View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi, Sateesh on 29/01/23.
//

import SwiftUI

struct Chapter4View: View {
    var body: some View {
        VStack {
            HeaderView()

            HStack(spacing: 15) {
                PricingView(title: "Basic", price: "$9", textColor: .white, backgroundColor: .purple)
                
                ZStack {
                    PricingView(title: "Pro", price: "$19", textColor: .black, backgroundColor: .init(red: 240/255, green: 240/255, blue: 240/255))
                    CaptionView(title: "Best for designer", offsetY: 87)
                }
            }
            .padding(.horizontal)
            
            ZStack {
                PricingView(title: "Team", price: "$299", textColor: .white, backgroundColor: .init(red: 62/255, green: 63/255, blue: 70/255), icon: "wand.and.rays")
                    .padding()
                
                CaptionView(title: "Perfect for teams with 20 members", offsetY: 108)
            }
            
            Spacer()
        }
    }
}

struct Chapter4View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter4View()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2.0) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct PricingView: View {
    var title: String
    var price: String
    var textColor: Color
    var backgroundColor: Color
    var icon: String? = nil

    var body: some View {
        VStack {
            icon.map {
                Image(systemName: $0)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
//            if let icon = icon {
//                Image(systemName: icon)
//                    .font(.largeTitle)
//                    .foregroundColor(textColor)
//            }
            Text(title)
                .fontWeight(.black)
                .font(.system(.title, design: .rounded))
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct CaptionView: View {
    var title: String
    var offsetY: CGFloat

    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .font(.system(.caption, design: .rounded))
            .foregroundColor(.white)
            .padding(5)
            .background(Color(red: 255/255, green: 183/255, blue: 37/255))
            .offset(x: 0, y: offsetY)
    }
}
