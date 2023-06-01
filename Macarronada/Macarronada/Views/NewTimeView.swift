//
//  NewTimeView.swift
//  Macarronada
//
//  Created by michellyes on 01/06/23.
//

import SwiftUI
import UserNotifications


struct NewTimeView: View {
    
    // codigo de dani
    
    let timeOptions = [1, 10, 15]
    @State private var timeRemaining = 600 // 10 minutos em segundos
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var showTimeOptions = false
    @State private var selectedTime = 0
    @State private var finished = false;
    var timeText = ""
    init(timeText: String) {
        self.timeText = timeText
    }
    class NotificationManager {
        static let instance = NotificationManager() //singleton
        func requestAuthorization() {
            let options: UNAuthorizationOptions = [.alert, .sound, .badge]
            UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
                if let error = error {
                    print("ERROR: \(error)")
                } else {
                    print("SUCCESS")
                }
            }
        }
        func scheduleNotification() {
            let content = UNMutableNotificationContent()
            content.title = "Seu tempo de atividade encerrou!"
            content.subtitle = "Aproveite uma pausa para desligar um pouco do projeto."
                content.sound = .default
                content.badge = 1
                //time
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
                let request = UNNotificationRequest(
                    identifier: UUID().uuidString,
                    content: content,
                    trigger: trigger)
                UNUserNotificationCenter.current().add(request)
                }
    }
    
    
    
    
    
    // codigo de chelly
    
    var body: some View {
        
        HStack{
            
            // MARK: CARD VIEW
            VStack{

                ZStack{
                    Color.appSuperLightOrange
                    
                    VStack{
                        
                        // card head
                        ZStack{
                            Color.appLightOrange
                            HStack {
        
                                Text("Start Boost")
                                    .foregroundColor(.appBrown)
                                    .frame(width: 120, height: 40, alignment: .leading)
                                Image(systemName: "alarm.fill")
                                    .imageScale(.large)
                                    .foregroundColor(.appBrown)
                                    .frame(width: 120, height: 40, alignment: .trailing)
                            }
                            
                        }
                        .frame(width: 270, height: 40)
                        
                        // card content
                        HStack {
                            Text(timeText)
                                .foregroundColor(.appBrown)
                                .frame(width: 120, height: 40, alignment: .leading)
                            
                            Text(timeString(from: timeRemaining))
                                .foregroundColor(.appBrown)
                                .frame(width: 120, height: 40, alignment: .trailing)
                                .onTapGesture {
                                                    showTimeOptions = true
                                                    NotificationManager.instance.requestAuthorization()
                                                    NotificationManager.instance.scheduleNotification()
                                                }
                                                .popover(isPresented: $showTimeOptions) {
                                                    menuContent
                                                        .background(Color.appBrown)
                                                        
                                                }

                        }
                        
                        HStack {
                            // BARRA DE PROGRESSO DO CARD
                            ProgressView(value: Double(timeRemaining), total: Double(getTotalTime()))
                                .accentColor(.appBrown)
                                .background(Color.appSuperLightOrange)
                                .frame(width: 270, height: 5, alignment: .bottom)
                                
                        }
                       
                    }
                }
                .frame(width: 270, height: 90)
                .cornerRadius(10)
                
                
            }
            
            // MARK: BUTTON PLAY/PAUSE VIEW
            
            ZStack{
                Color.appOrange
                Image(systemName: isTimerRunning ? "pause.fill" : "play.fill")
                    .imageScale(.large)
                    .foregroundColor(.appBrown)
                
            }
            .frame(width: 40, height: 90)
            .cornerRadius(10)
            .onTapGesture {
                if isTimerRunning {
                    pauseTimer()
                } else {
                    startTimer()
                }
                
            }
            
            
                
            
        }
                
    
    }
    
    
    
    // codigo de dani
    var menuContent: some View {
        VStack {
            ForEach(timeOptions, id: \.self) { option in
                Button(action: {
                    setTimer(minutes: option)
                    selectedTime = option
                    finished = false
                    showTimeOptions = false
                }) {
                    Text("\(option) minutos")
                        .foregroundColor(.appBrown)
                }
            }
        }
        .frame(width: 120, height: 100)
        .background(Color.purple)
    }

    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timer?.invalidate()
                    timer = nil
                    finished = true
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
    func setTimer(minutes: Int) {
        timeRemaining = minutes * 60
    }
    func getTotalTime() -> Int {
        return selectedTime * 60;
    }
    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    

    
    
    
    
    
}

