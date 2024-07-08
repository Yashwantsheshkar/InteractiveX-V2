//
//  BlobView.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 06/07/24.
//

import SwiftUI

struct BlobView: View {
    @State var appear = false
    var body: some View {
        TimelineView(.animation) { timeline in 
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 60)
            let x = cos(angle.radians)
            let angle2 = Angle.degrees(now.remainder(dividingBy: 6) * 10)
            let x2 = cos(angle2.radians)
//            Text("Value: \(x)")
            Canvas { context, size in
                context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: x, x2: x2), with: .linearGradient(Gradient(colors: [Color.pink, Color.blue]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 300, y: 500)))
            }
            .frame(width: 400, height: 412)
        }
        .onAppear{
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: true)){
                appear = true
            }
        }
        .rotationEffect(.degrees(appear ? 360 : 0))
            
    }
    func path(in rect: CGRect, x: Double, x2: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.9923*width, y: 0.42593*height))
        path.addCurve(to: CGPoint(x: 0.6355*width*x2, y: height), control1: CGPoint(x: 0.92554*width*x2, y: 0.77749*height*x2), control2: CGPoint(x: 0.91864*width*x2, y: height))
        path.addCurve(to: CGPoint(x: 0.08995*width, y: 0.60171*height), control1: CGPoint(x: 0.35237*width*x, y: height), control2: CGPoint(x: 0.2695*width, y: 0.77304*height))
        path.addCurve(to: CGPoint(x: 0.34086*width, y: 0.06324*height*x), control1: CGPoint(x: -0.0896*width, y: 0.43038*height), control2: CGPoint(x: 0.00248*width, y: 0.23012*height*x))
        path.addCurve(to: CGPoint(x: 0.9923*width, y: 0.42593*height), control1: CGPoint(x: 0.67924*width, y: -0.10364*height*x), control2: CGPoint(x: 1.05906*width, y: 0.07436*height*x2))
        path.closeSubpath()
        return path
    }
}
#Preview {
    BlobView()
}
struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.97991*width, y: 0.49581*height))
        path.addCurve(to: CGPoint(x: 0.71205*width, y: 0.99212*height), control1: CGPoint(x: 1.03571*width, y: 0.65079*height), control2: CGPoint(x: 0.96652*width, y: 0.93308*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.49581*height), control1: CGPoint(x: 0.45759*width, y: 1.05116*height), control2: CGPoint(x: 0, y: 0.71721*height))
        path.addCurve(to: CGPoint(x: 0.58929*width, y: 0.00319*height), control1: CGPoint(x: 0, y: 0.27441*height), control2: CGPoint(x: 0.37442*width, y: 0.04384*height))
        path.addCurve(to: CGPoint(x: 0.97991*width, y: 0.49581*height), control1: CGPoint(x: 0.80415*width, y: -0.03745*height), control2: CGPoint(x: 0.92411*width, y: 0.34083*height))
        path.closeSubpath()
        return path
    }
}
