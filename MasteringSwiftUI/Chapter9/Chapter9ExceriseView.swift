//
//  Chapter9ExceriseView.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi, Sateesh on 11/03/23.
//

import SwiftUI

struct Chapter9ExceriseView: View {
    @State private var isProcessing = false
    @State private var isCompleted = false
    @State private var isLoading = false

    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 300, height: 70)
                .foregroundColor(isCompleted ? .red : .green)
            if !isProcessing {
                Text("Submit")
                    .font(.system(.title, design: .rounded, weight: .bold))
                    .foregroundColor(.white)
                    .transition(.move(edge: .top))
            } else if isProcessing && !isCompleted {
                HStack {
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(Color.white, lineWidth: 4)
                        .frame(width: 30)
                        .rotationEffect(.degrees(isLoading ? 360 : 0))
                        .animation(.linear(duration: 1.0).repeatForever(autoreverses: false), value: isLoading)
                    Text("Processing")
                        .font(.system(.title, design: .rounded, weight: .bold))
                        .foregroundColor(.white)
                }
                .transition(.opacity)
                .onAppear {
                    startProcessing()
                }
            } else if isCompleted {
                Text("Done")
                    .font(.system(.title, design: .rounded, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .animation(.spring())
        .onTapGesture {
            if !isProcessing && !isLoading {
                isProcessing = true
            } else if isCompleted {
                endProcessing()
            }
        }
    }

    func startProcessing() {
        isLoading = true
        
        // Simulate an operation by using DispatchQueue.main.asyncAfter
        // In a real world project, you will perform a task here.
        // When the task finishes, you set the completed status to true
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            isCompleted = true
        }
    }

    func endProcessing() {
        isProcessing = false
        isCompleted = false
        isLoading = false
    }
}

struct Chapter9ExceriseView_Previews: PreviewProvider {
    static var previews: some View {
        Chapter9ExceriseView()
    }
}
