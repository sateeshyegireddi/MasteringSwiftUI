//
//  Chapter6View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi, Sateesh on 17/02/23.
//

import SwiftUI

struct Chapter6View: View {

    @State var isRotated = false

    var body: some View {
        
        // SIMPLE TEXT BUTTON

        Button {
            print("Hello button tapped!")
        } label: {
            Text("Hello World")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.purple)
        }


        // SIMPLE BORDERED TEXT BUTTON
        /*
         Button {
             print("Hello button tapped!")
         } label: {
             Text("Hello World")
                 .padding()
                 .font(.title)
                 .fontWeight(.bold)
                 .foregroundColor(.white)
                 .background(Color.purple)
                 .padding(10)
                 .border(Color.purple, width: 5) // For border 👈
         }
        */
         
        // SIMPLE BORDERED TEXT BUTTON WITH INSIDE PADDING
        // We can't use .border modifier with the rounded corners instead we use RoundedRectange shape as an overlay. 💡
        /*
        Button {
            print("Hello button tapped!")
        } label: {
            Text("Hello World")
                .padding()
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .background(Color.purple)
                .cornerRadius(40)
                .padding(10)
                // Try this line instead of adding overlay
//                .border(Color.purple, width: 5)
//                .cornerRadius(40)
                .overlay {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.purple, lineWidth: 5)
                }
        }
        */
        
        // BUTTON WITH SYSTEM IMAGE
        /*
        Button {
            print("Delete tapped!")
        } label: {
            Image(systemName: "trash")
                .padding()
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(Color.red)
                .clipShape(Circle()) // Don't forget clipShape 👈
        }
        */


        // BUTTON WITH SYSTEM IMAGE AND TEXT WITH BACKGROUND
        // We can have the gradients as the background to the Button 💡
        /*
        Button {
            print("Delete tapped!")
        } label: {
            HStack {
                Image(systemName: "trash")
                    .font(.title)
                Text("Delete")
                    .font(.title)
                    .fontWeight(.bold)
            }
            // DON'T FORGOT THIS LINE TO STRETCH THE VIEW 💡
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
//            .background(LinearGradient(colors: [.red, .blue],
//                                       startPoint: .topLeading,
//                                       endPoint: .bottomTrailing))
//            .background(
//                LinearGradient(
//                    colors: [Color("DarkGreen"), Color("LightGreen")],
//                    startPoint: .leading,
//                    endPoint: .trailing
//                )
//            )
            .cornerRadius(40)
            .shadow(radius: 20)
//            .shadow(color: .gray, radius: 20, x: 20, y: 10)
            .padding(.horizontal, 20)
        }
        */
         
        // RE-USEABLE BUTTON STYLE
        /*
        VStack {
            Button {
                print("Button is pressed!")
            } label: {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                    Text("Share")
                        .font(.title)
                        .bold()
                }
            }
            .buttonStyle(GradientBackgroundStyle())

            Button {
                print("Button is pressed!")
            } label: {
                HStack {
                    Image(systemName: "trash")
                        .font(.title)
                    Text("Delete")
                        .font(.title)
                        .bold()
                }
            }
            .buttonStyle(GradientBackgroundStyle())
        }
        */
        
        // EXCERCISE - ROTATE BUTTON WITH EFFECTS
        /*
        Button {
            withAnimation(.easeInOut) {
                isRotated.toggle()
            }
        } label: {
            Image(systemName: "plus")
                .font(.largeTitle)
                .bold()
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.purple)
        .clipShape(Circle())
        .rotationEffect(.degrees(isRotated ? 45 : 0))
        */
    }
}

struct Chapter6View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter6View()
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(
                LinearGradient(
                    colors: [Color("DarkGreen"), Color("LightGreen")],
                    startPoint: .leading, endPoint: .trailing
                )
            )
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
}
