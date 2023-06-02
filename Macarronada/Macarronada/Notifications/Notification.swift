//
//  Notification.swift
//  Macarronada
//
//  Created by vivi on 01/06/23.
//

import SwiftUI
import UserNotifications

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

