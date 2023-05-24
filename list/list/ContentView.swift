//
//  ContentView.swift
//  list
//
//  Created by Danielly Santos Lopes da Silva on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var textInput: String = ""
    @State private var inputList: [String] = []
    @State private var isTimerViewVisible = false
    
    var body: some View {
        VStack {
            TextField("Digite algo", text: $textInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onSubmit {
                    addItemToList()
                }
            
            
            VStack {
                HStack {
                    List(inputList, id: \.self) { input in
                        Text(input)
                    }
                    
                    if isTimerViewVisible {
                        TempoView()
                    }
                    
                    Spacer()
                }
                
                
            }
        }
        
        
    }
    
    private func addItemToList() {
        guard !textInput.isEmpty else { return }
        inputList.append(textInput)
        textInput = ""
        isTimerViewVisible = true
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TempoView: View {
    @State private var timeRemaining = 600 // 10 minutos em segundos
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    
    var body: some View {
        HStack {
            Text(timeString(from: timeRemaining))
                .font(.body)
                .padding()
            
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 20)
                
                Circle()
                    .trim(from: 0, to: CGFloat(timeRemaining) / 600)
                    .stroke(Color.blue, lineWidth: 10)
                    .rotationEffect(.degrees(-90))
                
                Button(action: {
                    if isTimerRunning {
                        pauseTimer()
                    } else {
                        startTimer()
                    }
                }) {
                    Text(isTimerRunning ? Image(systemName: "pause.fill") : Image(systemName: "play.fill")
                         
                         
                    )
                    .font(.title)
                }
            }.frame(width: 20, height: 20)
            
            
            
        }.frame(width: 100, height: 40)
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

