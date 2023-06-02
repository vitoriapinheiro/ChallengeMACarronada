//
//  PopoverView.swift
//  Macarronada
//
//  Created by vivi on 25/05/23.
//

import SwiftUI

struct PopoverView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [])
    var tasks: FetchedResults<UserTask>
    
    @State private var taskTitle: String = ""
    @State private var taskTime: Int = 0
    @State private var taskStatus: String = "notStarted"
    
    var body: some View {
        ZStack{
            Color.white
            VStack(alignment: .center){
                TabBarView()
            }
        }.frame(minWidth: 400, maxWidth: 600, minHeight: 400, maxHeight: 600)
    }
    
    func deletePersistentStore() {
        let persistentContainer = NSPersistentContainer(name: "UserTasks")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                print("Failed to load persistent stores: \(error)")
            } else {
                do {
                    try persistentContainer.persistentStoreCoordinator.destroyPersistentStore(at: persistentContainer.persistentStoreCoordinator.persistentStores[0].url!, ofType: NSSQLiteStoreType, options: nil)
                    print("Persistent store deleted successfully.")
                } catch {
                    print("Failed to delete persistent store: \(error)")
                }
            }
        }
    }

}

