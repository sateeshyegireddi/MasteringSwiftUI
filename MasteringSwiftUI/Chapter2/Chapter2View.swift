//
//  Chapter2View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi, Sateesh on 25/01/23.
//

import SwiftUI

struct Chapter2View: View {

    var body: some View {
        Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don ’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
            .font(.system(.title, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.gray)
//            .lineLimit(3)
//            .textCase(.lowercase)
            .truncationMode(.middle)
            .lineSpacing(10)
            .multilineTextAlignment(.center)
//            .scaleEffect(2.0)
//            .rotationEffect(.degrees(20), anchor: .init(x: 0, y: 0))
//            .rotation3DEffect(.degrees(45), axis: (x: 0, y: 1, z: 0))
            .padding()
    }
}

struct Chapter2View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2View()
    }
}
