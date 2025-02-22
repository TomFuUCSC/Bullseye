//
//  Shapes.swift
//  Bullseye
//
//  Created by Tom Fu on 7/2/23.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    var body: some View {
        VStack{
            if !wideShapes{
                Circle()
                    //.fill(Color.blue)
                    .strokeBorder(Color.blue, lineWidth: 20)
                    .frame(width: 200, height: 100)
                    .background(Color.green)
                    .transition(.scale)
            }
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .frame(width: wideShapes ? 200: 100, height: 100)
     //           .animation(.easeInOut, value: wideShapes)
            Capsule()
                .fill(.blue)
                .frame(width: wideShapes ? 200: 100, height: 100)
            Ellipse()
                .fill(.blue)
                .frame(width: wideShapes ? 200: 100, height: 100)
            Button("Animate") {
                withAnimation {
                    wideShapes.toggle()
                }
            }
        }
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
