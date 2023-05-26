//
//  AppDelegate.swift
//  Macarronada
//
//  Created by vivi on 25/05/23.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    static var popover = NSPopover() // maybe add a static later
    var statusBar: StatusBarController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        Self.popover.contentViewController = NSHostingController(rootView: PopoverView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext))
        Self.popover.behavior = .transient // maybe chage it later to semitransient

        statusBar = StatusBarController(Self.popover)
    }
}

