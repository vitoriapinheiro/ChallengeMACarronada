//
// TempoView.swift
// Espresso
//
// Created by vko on 31/05/23.
//
import SwiftUI
import UserNotifications
struct TimeView: View {
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
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("oii")
                    .frame(width: 30, height: 10)
                Button(action: {
                    showTimeOptions = true
                    NotificationManager.instance.requestAuthorization()
                    NotificationManager.instance.scheduleNotification()
                }) {
                    Image(systemName: "clock")
                }
                .popover(isPresented: $showTimeOptions) {
                    menuContent
                        .background(Color.black)
                        .padding()
                }
            }.frame(width: 20, height: 20)
                .background(Color.blue)
            HStack {
                ZStack {
                    Rectangle().foregroundColor(.red)
                    VStack(alignment: .leading) {
                        ZStack {
                            Rectangle()
                            HStack {
                                Text(timeText)
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .cornerRadius(8)
                                Spacer()
                                Text(timeString(from: timeRemaining))
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                                //.buttonStyle(BorderlessButtonStyle())
                            }.padding(4)
                        }
                        HStack {
                            ProgressView(value: Double(timeRemaining), total: Double(getTotalTime()))
                                .accentColor(.black)
                                .padding(.horizontal)
                        }
                    }
                }
                .cornerRadius(8)
                HStack {
                    Button {
                        print("printou")
                    } label: {
                        if (finished) {
                            Image(systemName: "pause.fill")
                        }
                    }
                    Button(action: {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Image(systemName: isTimerRunning ? "pause.fill" : "play.fill")
                            .font(.title)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(width: 20, height: 20)
                    .background(Color.orange)
                }
            }
        }.padding(10)
            .onAppear {
                startTimer()
            }
    }
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
                }
                .padding()
            }
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
