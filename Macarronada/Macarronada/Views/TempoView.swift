//
//  TempoView.swift
//  Macarronada
//
//  Created by Danielly Santos Lopes da Silva on 26/05/23.
//

import SwiftUI

struct TempoView: View {
    @State private var timeRemaining = 600 // 10 minutos em segundos
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    
    var body: some View {
        HStack{
            ZStack{
                Rectangle().foregroundColor(.red)
                VStack(alignment: .leading) {
                    ZStack{
                        Rectangle()
                        Text(timeString(from: timeRemaining))
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        
                    }
                    
                    HStack {
                        ProgressView(value: Double(timeRemaining), total: 600)
                            .accentColor(.black)
                            .padding(.horizontal)
                        //                        .frame(width: 326)
                    }
                }
                
            }
            .cornerRadius(8)
            HStack {
                Button(action: {
                    if isTimerRunning {
                        pauseTimer()
                    } else {
                        startTimer()
                    }
                }) {
                    Image(systemName: isTimerRunning ? "pause.fill" : "play.fill")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .buttonStyle(BorderlessButtonStyle())
                .frame(width: 43, height: 88)
                .background(Color.orange)
                .cornerRadius(8)
            }
        }
        
        
        .onAppear {
            startTimer()
        }
    }
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timer?.invalidate()
                    timer = nil
                }
            }
            isTimerRunning = true
        }
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
    }
    
    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


struct TempoView_Previews: PreviewProvider {
    static var previews: some View {
        TempoView()
    }
}
