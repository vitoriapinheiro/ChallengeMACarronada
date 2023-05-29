////
////  testeeee.swift
////  list
////
////  Created by Danielly Santos Lopes da Silva on 29/05/23.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Hello, SwiftUI!")
//                .font(.largeTitle)
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .clipShape(CustomCorner(topLeft: 4, topRight: 4, bottomLeft: 0, bottomRight: 0))
//            
//            Spacer()
//        }
//        .padding()
//    }
//}
//
//struct CustomCorner: Shape {
//    var topLeft: CGFloat
//    var topRight: CGFloat
//    var bottomLeft: CGFloat
//    var bottomRight: CGFloat
//    
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let topLeftRadius = min(min(topLeft, rect.width / 2), rect.height / 2)
//        let topRightRadius = min(min(topRight, rect.width / 2), rect.height / 2)
//        let bottomLeftRadius = min(min(bottomLeft, rect.width / 2), rect.height / 2)
//        let bottomRightRadius = min(min(bottomRight, rect.width / 2), rect.height / 2)
//        
//        path.move(to: CGPoint(x: rect.minX, y: rect.minY + topLeftRadius))
//        path.addArc(center: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY + topLeftRadius), radius: topLeftRadius, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
//        
//        path.addLine(to: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY))
//        path.addArc(center: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY + topRightRadius), radius: topRightRadius, startAngle: .degrees(270), endAngle: .degrees(0), clockwise: false)
//        
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomRightRadius))
//        path.addArc(center: CGPoint(x: rect.maxX - bottomRightRadius, y: rect.maxY - bottomRightRadius), radius: bottomRightRadius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
//        
//        path.addLine(to: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY))
//        path.addArc(center: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY - bottomLeftRadius), radius: bottomLeftRadius, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
//        
//        return path
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
