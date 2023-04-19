//
//  DraggableView.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 19/04/23.
//

import SwiftUI

struct DraggableView<Content>: View where Content: View {
    @GestureState private var dragState = DraggableState.inactive
    @State private var position = CGSize.zero
    
    var content: () -> Content

    var body: some View {
        content()
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .animation(.easeInOut, value: dragState.isPressing)
            .animation(.easeInOut, value: dragState.translation)
            .offset(x: position.width + dragState.translation.width,
                    y: position.height + dragState.translation.height)
            .gesture(
                LongPressGesture()
                    .updating($dragState) { currentState, state, translation in
                        state = .pressing
                    }
                    .sequenced(before: DragGesture())
                    .updating($dragState) { value, state, translation in
                        switch value {
                        case .first(true):
                            print("Tapping")
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
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
    }
}
