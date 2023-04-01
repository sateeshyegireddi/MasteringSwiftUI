//
//  Chapter5View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi, Sateesh on 29/01/23.
//

import SwiftUI

struct Chapter5View: View {
    var body: some View {

        // VERTICAL SCROLLING

        /*
        ScrollView {
            ReadingHeaderView()

            VStack {
                CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
            }
        }
        .padding()
        */

        // HORIZONTAL SCROLLING

        ScrollView(.horizontal, showsIndicators: false) {
            ReadingHeaderView()

            HStack {
                Group {
                    CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                    CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                    CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                    CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
                }
                .frame(width: 300)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct Chapter5View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter5View()
    }
}

// MARK: - Card View
struct CardView: View {
    var image: String
    var category: String
    var heading: String
    var author: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()

            HStack {
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(heading)
                        .minimumScaleFactor(0.5) // To reduce the font size
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(author.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        // This is to add a small line around the card. See by setting lineWidth to 10
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
    }
}

// MARK: - Content Header View
struct ReadingHeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Sunday 29 Jan")
                    .textCase(.uppercase)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("Your Reading")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
            }
            Spacer()
        }
    }
}

struct ReadingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingHeaderView()
    }
}
