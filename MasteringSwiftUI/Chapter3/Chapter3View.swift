//
//  Chapter3View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi, Sateesh on 27/01/23.
//

import SwiftUI

struct Chapter3View: View {
    var body: some View {

        // Example 1 - System image

        Image(systemName: "cloud.sun.rain")
            .font(.system(size: 100))
            .foregroundColor(.blue)
            .shadow(color: .black, radius: 10, x: 0, y: 10)

        // Example 2 - Custom image
        /*
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fill) // = .scaledToFill()
            .frame(width: 300)
            .clipShape(Circle())
//            .clipped() // takes rectangle clip shape by default.
         // If we want to change the shape then, try .clipShape
            .overlay {
                Image(systemName: "heart.fill")
                    .opacity(0.5)
                    .font(.system(size: 30))
                    .foregroundColor(.red)
            }
        */
        
        // Example 3 - Image Overlay
        /*
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(alignment: .top) {
                Text("If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveable feast.\n\n- Ernest Hemingway")
                    .fontWeight(.heavy)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .opacity(0.8)
                    .padding()
            }
        */
        
        // Example 4 - More Overlay
        // Using Rectangle with color
        /*
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay {
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(0.4)
            }
        */
        
        // Example 4 - More Overlay
        // In SwiftUI, Color is also a view.
        /*
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay {
                Color.black.opacity(0.4)
            }
        */

        // Example 5 - More and more Overlay
        // We can nested overlays in SwiftUI 💡
        /*
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay { // overlay - 1 👈
                Color.black.opacity(0.4)
                    .overlay { // overlay - 2 👈
                        Text("Paris")
                            .fontWeight(.black)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 200)
                    }
            }
        */
         
    }
}

struct Chapter3View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3View()
    }
}

