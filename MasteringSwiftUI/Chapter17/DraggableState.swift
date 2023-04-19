//
//  DraggableState.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 19/04/23.
//

import Foundation

enum DraggableState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}
