//
//  MacarronadaApp.swift
//  Macarronada
//
//  Created by vivi on 23/05/23.
//

import SwiftUI

@main
struct MacarronadaApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
