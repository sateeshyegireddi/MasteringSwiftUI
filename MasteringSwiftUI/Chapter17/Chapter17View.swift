//
//  Chapter17View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 11/04/23.
//

import SwiftUI

struct Chapter17View: View {
    @State private var isPressed = false
    @GestureState private var longPressTap = false
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero

    @GestureState private var scale: CGFloat = 1.0

    var body: some View {
        
        // GESTURE RECOGNIZERS
        
        // TAP GESTURE

        Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .scaleEffect(isPressed ? 0.25 : 1.0)
            .animation(.easeOut(duration: 0.2), value: isPressed)
            .foregroundColor(.green)
            .gesture( // we have a .gesture modifier 👈
                TapGesture()
                    .onEnded {
                        self.isPressed.toggle()
                    }
            )

        
        // LONG PRESS GESTURE
        /*
        Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .scaleEffect(isPressed ? 0.25 : 1.0)
            .animation(.easeOut(duration: 0.2), value: isPressed)
            .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .onEnded { _ in
                        self.isPressed.toggle()
                    }
            )
        */

        // @GestureState PROPERTY WRAPPER
        // @GestureState gets reset after release the touch 💡
        // @GestureState with LongPressGesture
        /*
        Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .scaleEffect(isPressed ? 0.25 : 1.0)
            .opacity(longPressTap ? 0.4 : 1.0) // fade off while touching 👈
            .animation(.easeOut(duration: 0.2), value: isPressed)
            .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .updating($longPressTap) { currentState, state, transaction in
                        state = currentState // Copying the state of touch 👈
                    } // Called during the touch 👈
                    .onEnded { _ in
                        self.isPressed.toggle()
                    }
            )
        */
        
        // @GestureState with DragGesture
        /*
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .offset(x: position.width + dragOffset.width,
                    y: position.height + dragOffset.height)
            .animation(.easeOut(duration: 0.5), value: dragOffset)
            .foregroundColor(.green)
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { value, state, transaction in
                        // value - holds the current data of drag
                        state = value.translation // Try by commenting this line of code 👈.
                    })
                    .onEnded { value in
                        position.width += value.translation.width
                        position.height += value.translation.height
                    }
            )
         */
        
        // COMBAINING GESTURES
        // Combining multiple gestures
        /*
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .opacity(longPressTap ? 0.5 : 1.0)
            .foregroundColor(.green)
            .animation(.easeInOut, value: longPressTap)
            .animation(.easeInOut, value: dragOffset)
            .offset(x: position.width + dragOffset.width,
                    y: position.height + dragOffset.height)
            .gesture(
                LongPressGesture()
                    .updating($longPressTap) { currentState, state, translation in
                        state = currentState
                    }
                    .sequenced(before: DragGesture())
                    .updating($dragOffset) { value, state, translation in
                        switch value {
                        case .first(true):
                            print("Tapping")
                        case .second(true, let drag):
                            state = drag?.translation ?? .zero
                        default:
                            break
                        }
                    }
                    .onEnded { value in
                        guard case .second(true, let drag?) = value else {
                            return
                        }
                        self.position.width += drag.translation.width
                        self.position.height += drag.translation.height
                    }
            )
        */

        // MORE REFACTORING ON GESTURE COMBING
        /*
        DraggableView {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.green)
        }
        */
        
        /*
        DraggableView {
            Text("Swift")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .foregroundColor(.red)
        }
        */
        
        // MAGNIFICATION GESTURE
        
        /*
        Image(systemName: "airpodsmax")
            .font(.system(size: 200))
            .foregroundColor(.purple)
            .scaleEffect(scale)
            .gesture(
                MagnificationGesture()
                    .updating($scale) { value, scale, transaction in
                        scale = value.magnitude
                    }
            )
        */
    }
}

struct Chapter17View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter17View()
    }
}
