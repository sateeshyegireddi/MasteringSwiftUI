//
//  Chapter7View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi, Sateesh on 24/02/23.
//

import SwiftUI

struct Chapter7View: View {
    @State var isPlaying = false

    @State var counter = 0

    @State var blueCounter = 0
    @State var greenCounter = 0
    @State var redCounter = 0

    var body: some View {
        
        // SIMPLE STATE EXAMPLE

        /*
        Button {
            isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                .font(.system(size: 150))
                .foregroundColor(isPlaying ? .red : .green)
        }
        */
         
        // COUNTER WITH STATE EXAMPLE

        /*
        Button {
            self.counter += 1
        } label: {
            Text("\(counter)")
                .font(.system(size: 100, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .frame(width: 200, height: 200)
                .background(.red)
                .clipShape(Circle())
        }
        */
        
        // MULTIPLE STATE VIEWS
        
        /*
        VStack {
            CounterButton(counter: $blueCounter, color: .blue)
            CounterButton(counter: $greenCounter, color: .green)
            CounterButton(counter: $redCounter, color: .red)
        }
        */
        
        // STATE'S EXCERCISE


        VStack {
            Text("\(blueCounter + greenCounter + redCounter)")
                .font(.system(size: 125, weight: .bold, design: .rounded))
            HStack {
                IncrementButton(counter: $blueCounter, color: .blue)
                IncrementButton(counter: $greenCounter, color: .green)
                IncrementButton(counter: $redCounter, color: .red)
            }
            .padding(.horizontal)
        }
        

    }
}

struct CounterButton: View {
    @Binding var counter: Int
    var color: Color

    var body: some View {
        Button {
            self.counter += 1
        } label: {
            Text("\(counter)")
                .font(.system(size: 100, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .frame(width: 200, height: 200)
                .background(color)
                .clipShape(Circle())
        }
    }
}

struct IncrementButton: View {
    @Binding var counter: Int
    var color: Color

    var body: some View {
        Button {
            self.counter += 1
        } label: {
            Circle()
                .foregroundColor(color)
                .frame(maxWidth: 200, maxHeight: 200)
                .overlay {
                    Text("\(counter)")
                        .font(.system(size: 50, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                }
        }
    }
}

struct Chapter7View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter7View()
    }
}
