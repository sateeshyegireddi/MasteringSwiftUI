//
//  Chapter8View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi, Sateesh on 25/02/23.
//

import SwiftUI

struct Chapter8View: View {
    
    let originX = 20
    let originY = 20
    let maxX = 200
    let maxY = 200
    
    private var purpleGradient = LinearGradient(
        gradient: Gradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255),
                                    Color(red: 107/255, green: 116/255, blue: 179/255)]),
        startPoint: .trailing,
        endPoint: .leading
    )

    var body: some View {
        
        // SIMPLE PATH MOVE & ADD LINE & FILL
        /*
        Path { path in
            path.move(to: .init(x: originX, y: originY)) // .move 👈
            path.addLine(to: .init(x: maxX, y: originY)) // .addLine 👈
            path.addLine(to: .init(x: maxX, y: maxY))
            path.addLine(to: .init(x: originX, y: maxY))
        }
        .fill(.green)
//        .foregroundColor(.red) // Try this line in place of .fill modifier
        */

        // PATH WITH BORDER
        /*
        Path { path in
            path.move(to: .init(x: originX, y: originY))
            path.addLine(to: .init(x: maxX, y: originY))
            path.addLine(to: .init(x: maxX, y: maxY))
            path.addLine(to: .init(x: originX, y: maxY))
            // Try this in place of closeSubPath and observe that there is no fulfill.
//            path.addLine(to: .init(x: originX, y: originY))
            path.closeSubpath() // .closeSubpath 👈
        }
        .stroke(Color.green, lineWidth: 10) // .stroke is important as much as .fill 😀
        */
        
        // PATH WITH QUAD CURVE
        /*
        Path { path in
            path.move(to: .init(x: 20, y: 60))
            path.addLine(to: .init(x: 40, y: 60))
            // .addQuadCurve 👈
            path.addQuadCurve(to: .init(x: 210, y: 60), control: .init(x: 125, y: 0))
            path.addLine(to: .init(x: 230, y: 60))
            path.addLine(to: .init(x: 230, y: 100))
            path.addLine(to: .init(x: 20, y: 100))
            path.closeSubpath()
        }
        .fill(Color.purple)
        */
         
        // QUAD CURVE
        // We can't directly apply fill and stroke at a time.
        // Instead, we have to use ZStack to show one on another. 💡

        /*
        ZStack {
            quadCurvePath()
                .fill(Color.purple)

            quadCurvePath()
                .stroke(Color.black, lineWidth: 10)
        }
        */

        // ARC
        // Arc path will start from 0º (right-mid-point)
        // Don't confuse with fill part it's opposite to arc's occupied area.
        /*
        Path { path in
            path.move(to: .init(x: 200, y: 200))
            path.addArc(center: .init(x: 200, y: 200), // .addArc 👈
                        radius: 150,
                        startAngle: .degrees(0),
                        endAngle: .degrees(45),
                        clockwise: true)
        }
        .fill(Color.green)
        */
         
        // ARC's - PIE CHART
        /*
        ZStack {
            pieChartPart(startAngle: 0, endAngle: 190)
                .fill(Color.yellow)

            pieChartPart(startAngle: 190, endAngle: 110)
                .fill(Color.teal)

            pieChartPart(startAngle: 110, endAngle: 90)
                .fill(Color.blue)

            pieChartPart(startAngle: 90, endAngle: 360)
                .fill(.purple)
                .offset(.init(width: 20, height: 20))

            pieChartPart(startAngle: 90, endAngle: 360)
                .stroke(Color(red: 52/255, green: 52/255, blue: 122/255),
                        lineWidth: 10)
                .offset(.init(width: 20, height: 20))
                .overlay {
                    Text("25%")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .offset(.init(width: 80, height: -110))
                }
        }
        */
        
        // PATH'S addRect METHOD
        // Use .addRect modifier to add rectange to Path

        Path { path in
            path.move(to: .init(x: 0, y: 0))
            path.addQuadCurve(to: .init(x: 200, y: 0),
                              control: .init(x: 100, y: 20))
//            path.addLine(to: .init(x: 200, y: 40))
//            path.addLine(to: .init(x: 200, y: 40))
//            path.addLine(to: .init(x: 0, y: 40))
            // .addRect in place of .addLine 👈
//            path.addRect(.init(origin: .zero, size: .init(width: 200, height: 50)))
            path.closeSubpath()
        }
        .fill(.green)

         
        // PATH AS REUSABLE COMPONENT
        /*
        Text("Test")
            .font(.system(.largeTitle, design: .rounded, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 250, height: 50)
            // Path as a shape subclass 🤔
            .background(Dome().fill(.red))
        */
        
        // PATH AS REUSABLE COMPONENT
        // We can cut off the shape to certain amount with .trim modifier.
        /*
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 300, height: 300)
            
            Circle()
                .trim(from: 0.0, to: 0.85) // .trim 👈
                .stroke(purpleGradient, lineWidth: 20)
                .frame(width: 300, height: 300)
                .overlay {
                    VStack {
                        Text("85%")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        Text("complete")
                            .font(.system(.body, design: .rounded, weight: .bold))
                            .foregroundColor(.gray)
                    }
                }
        }
        */
        
        // PIE CHART WITH CIRCLE'S .trim and .overlay
        /*
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.4)
                .stroke(Color.blue, lineWidth: 80)

            Circle()
                .trim(from: 0.4, to: 0.6)
                .stroke(Color.teal, lineWidth: 80)

            Circle()
                .trim(from: 0.6, to: 0.75)
                .stroke(Color.purple, lineWidth: 80)

            Circle()
                .trim(from: 0.75, to: 1.0)
                .stroke(Color.yellow, lineWidth: 90)
                .overlay {
                    Text("25%")
                        .font(.system(.title, design: .rounded, weight: .bold))
                        .foregroundColor(.white)
                        .offset(x: 90, y: -90)
                }
        }
        .frame(width: 250, height: 250)
        */
    }
}

struct Chapter8View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter8View()
    }
}

extension Chapter8View {
    @ViewBuilder
    func quadCurvePath() -> Path {
        Path { path in
            path.move(to: .init(x: 20, y: 60))
            path.addLine(to: .init(x: 40, y: 60))
            path.addQuadCurve(to: .init(x: 210, y: 60), control: .init(x: 125, y: 0))
            path.addLine(to: .init(x: 230, y: 60))
            path.addLine(to: .init(x: 230, y: 100))
            path.addLine(to: .init(x: 20, y: 100))
            path.closeSubpath()
        }
    }

    @ViewBuilder
    func pieChartPart(startAngle: Double, endAngle: Double) -> Path {
        Path { path in
            path.move(to: .init(x: 187, y: 187))
            path.addArc(
                center: .init(x: 187, y: 187),
                radius: 150,
                startAngle: .degrees(startAngle),
                endAngle: .degrees(endAngle),
                clockwise: true
            )
            path.closeSubpath()
        }
    }
}

struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: 0, y: 0))
            path.addQuadCurve(to: .init(x: rect.width, y: 0),
                              control: .init(x: rect.width / 2, y: -(rect.width * 0.1)))
            path.addRect(.init(origin: .zero, size: .init(width: rect.width, height: rect.height)))
            path.closeSubpath()
        }
    }
}
