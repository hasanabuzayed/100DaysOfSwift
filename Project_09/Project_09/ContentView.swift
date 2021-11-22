//
//  ContentView.swift
//  Project_09
//
//  Created by Hasan Abuzayed on 11/14/21.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(LinearGradient(
                        gradient: Gradient(colors: [
                            color(for: value, brightness: 1),
                            color(for: value, brightness: 0.5)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct Arrow: InsettableShape {
    var insetAmount: CGFloat = .zero
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX + insetAmount, y: rect.minY + insetAmount))
        path.addLine(to: CGPoint(x: rect.minX + insetAmount, y: rect.midY + insetAmount))
        path.addLine(to: CGPoint(x: (rect.midX / 1.5) + insetAmount, y: rect.midY + insetAmount))
        path.addLine(to: CGPoint(x: (rect.midX / 1.5) + insetAmount, y: (rect.maxY) + insetAmount))
        path.addLine(to: CGPoint(x: (rect.maxX / 1.5) + insetAmount, y: (rect.maxY) + insetAmount))
        path.addLine(to: CGPoint(x: (rect.maxX / 1.5) + insetAmount, y: (rect.midY) + insetAmount))
        path.addLine(to: CGPoint(x: (rect.maxX / 1.5) + insetAmount, y: (rect.midY) + insetAmount))
        path.addLine(to: CGPoint(x: (rect.maxX) - insetAmount, y: (rect.midY) + insetAmount))
        path.addLine(to: CGPoint(x: rect.midX + insetAmount, y: rect.minY + insetAmount))
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct ContentView: View {
    @State private var amount: Double = 20
    
    var body: some View {
        VStack {
            Arrow()
                .strokeBorder(ImagePaint(image: Image("rdr2"), scale: 0.5), style: StrokeStyle(lineWidth: amount, lineCap: .round, lineJoin: .round))
            
            Slider(value: $amount, in: 1...30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //            .preferredColorScheme(.dark)
    }
}
