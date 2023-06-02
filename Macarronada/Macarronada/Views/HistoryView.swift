//
//  HistoryView.swift
//  Macarronada
//
//  Created by vivi on 01/06/23.
//

import SwiftUI

struct HistoryView: View {
    @State var update = false

    var body: some View {
        VStack(alignment: .center){
            Button("Limpar histórico"){
                deletePersistentStore()
                self.update = true
            }
                .buttonStyle(.borderedProminent)
            HistoryCardView()
        }
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

