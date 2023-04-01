//
//  Chapter9View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi, Sateesh on 10/03/23.
//

import SwiftUI

struct Chapter9View: View {
    @State private var scale = 1.0 // 1.75
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false

    @State private var isLoading = false
    @State private var progress = 0.0

    @State private var recordBegin = false
    @State private var isRecording = false
    
    @State private var show = false

    var body: some View {

        // IMPLICIT ANIMATION - .animation as the modifier

        ZStack {
            Circle()
                .fill(circleColorChanged ? Color(.systemGray5) : Color.red)
                .frame(width: 200, height: 200)
            
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        .animation( // 👈
            .spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3),
            value: heartSizeChanged
        )
        .onTapGesture {
            circleColorChanged.toggle()
            heartColorChanged.toggle()
            heartSizeChanged.toggle()
        }

        // EXPLICIT ANIMATION - withAnimation() is a closure
        /*
        ZStack {
            Circle()
                .fill(circleColorChanged ? Color(.systemGray5) : Color.red)
                .frame(width: 200, height: 200)
            
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        .onTapGesture {
            withAnimation( // 👈
                .spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)
            ) {
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
                // self.heartSizeChanged.toggle() // Try this
            }
            self.heartSizeChanged.toggle()
        }
        */

        // .scaleEffect do not work if we apply .animation modifier to a View.
        /*
        ZStack {
            Circle()
                .fill(circleColorChanged ? Color(.systemGray5) : Color.red)
                .frame(width: 200, height: 200)
                .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3))
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5) // 🤔 Did you note that scaleEffect animation is not working after .animation modifier applied before to it.
        }
        .onTapGesture {
            circleColorChanged.toggle()
            heartColorChanged.toggle()
            heartSizeChanged.toggle()
        }
        */
        
        // ANIMATING LOADING INDICATOR (ANDROID)
        /*
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(isLoading ? 360 : 0))
            .animation(
                Animation.linear(duration: 5)
                    .repeatForever(autoreverses: false) // This control repeatition 👈
            )
            .onAppear {
                isLoading = true
            }
        */
        
        // CIRCULAR PROGRESS
        /*
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 150, height: 150)
            
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.green, lineWidth: 7)
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(isLoading ? 360 : 0))
                .animation(
                    Animation.linear(duration: 1)
                        .repeatForever(autoreverses: false)
                )
                .onAppear {
                    isLoading = true
                }
        }
        */
        
        // CONTINUOUS PROGRESS BAR

        /*
        ZStack {
            Text("Loading")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .offset(x: 0, y: -50)

            Capsule()
                .frame(height: 10)
                .foregroundColor(Color(.systemGray5))
                .frame(width: 250)

            Capsule()
                .frame(width: 30, height: 10)
                .foregroundColor(.green)
                .offset(x: isLoading ? 110 : -110, y: 0)
                .animation(
                    .linear(duration: 1).repeatForever(autoreverses: false),
                    value: isLoading
                )
        }
        .onAppear {
            isLoading = true
        }
        */
        
        // CIRCULAR PROGRESS WITH LINEAR FILLING

        /*
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 20)
                .frame(width: 200)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 10,
                                           lineCap: .round,
                                           lineJoin: .round))
                .foregroundColor(.green)
                .frame(width: 200)
                .rotationEffect(.degrees(-90.0))
                .animation(.linear(duration: 1), value: progress)

            Text("\(Int(progress * 100))%")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                self.progress += 0.05
                if self.progress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
        */

        // DOTS ANIMATION (MS SKYPE)
        
        /*
        HStack {
            ForEach(0..<5) { index in
                Circle()
                    .frame(width: 10)
                    .foregroundColor(.green)
                    .scaleEffect(isLoading ? 0 : 1)
                    .animation(
                        .linear.repeatForever().delay(0.6 * Double(index)),
                        value: isLoading
                    )
            }
        }
        .onAppear {
            self.isLoading = true
        }
        */
        
        // COMBINING ANIMATIONS (AUDIO RECORDING EXAMPLE)

        /*
        ZStack {
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                .foregroundColor(recordBegin ? .red : .green)
                .frame(width: recordBegin ? 60 : 250, height: 60)
                .overlay {
                    Image(systemName: "mic.fill")
                        .font(.system(.title))
                        .foregroundColor(.white)
                        .scaleEffect(isRecording ? 0.7 : 1.0)
                }
            RoundedRectangle(cornerRadius: recordBegin ? 35 : 5)
                .trim(from: 0.0, to: recordBegin ? 0.0001 : 1.0)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ? 70 : 260, height: 70)
                .foregroundColor(.green)
        }
        .onTapGesture {
            withAnimation(.spring()) {
                recordBegin.toggle()
            }
            withAnimation(.spring().repeatForever().delay(0.5)) {
                isRecording.toggle()
            }
        }
        */

        // TRANSITIONS
        // Apply all of the commented transitions
        /*
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay {
                    Text("Show Details")
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }

            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.purple)
                    .overlay {
                        Text("Well, here is the Details")
                            .font(.system(.largeTitle, design: .rounded, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .transition(.scale(scale: 0, anchor: .bottom))
//                    .transition(.opacity)
//                    .transition(.slide)
//                    .transition(.move(edge: .bottom))
//                    .transition(.push(from: .top))
//                    .transition(.offsetScaleOpacity)
//                    .transition(.scaleOffset)
            }
        }
        */
    }
}

extension AnyTransition {
    static var offsetScaleOpacity: Self {
        AnyTransition
            .offset(x: -600, y: 0)
            .combined(with: .scale)
            .combined(with: .opacity)
    }

    static var scaleOffset: Self {
        AnyTransition
            .asymmetric(
                insertion: .scale(scale: 0, anchor: .bottom),
                removal: .offset(x: -600, y: 0)
            )
    }
}

struct Chapter9View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter9View()
    }
}
