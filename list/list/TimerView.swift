//
//  TimerView.swift
//  list
//
//  Created by Danielly Santos Lopes da Silva on 24/05/23.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 600 // 10 minutos em segundos
    @State private var progress: CGFloat = 1.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        HStack {
            Text("\(timeString(time: timeRemaining))")
                .font(.largeTitle)
                .foregroundColor(.black)
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 10)
                    .opacity(0.3)
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.blue, lineWidth: 10)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                
                Button("Play") {
                    startTimer()
                }
                
                
            }
            .frame(width: 200, height: 200)
            
           
        }
        .padding(10)
        .onReceive(timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
                progress = CGFloat(timeRemaining) / 600.0 // Divide pelo total de segundos (10 minutos)
            }
        }
    }
    
    func startTimer() {
        timeRemaining = 600 // 10 minutos em segundos
        progress = 1.0
    }
    
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
