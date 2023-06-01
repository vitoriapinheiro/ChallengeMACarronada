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
            VStack(alignment: .leading){
                TabBarView()
                TimeView(timeText: "batata")
            TextField("Digite aqui", text: $taskTitle)
                    .foregroundColor(.black)
            HStack{
                Button("Apagar tudo"){
                    deletePersistentStore()
                }
                .buttonStyle(.borderedProminent)
                Button("Cancelar"){
                    NSApplication.shared.terminate(nil)
                }
                .buttonStyle(.borderedProminent)
                Spacer()
                Button("Salvar"){
                    if !taskTitle.isEmpty{
                        let userTask = UserTask(context: viewContext)
                        userTask.id = UUID()
                        userTask.title = taskTitle
                        userTask.time = taskTime
                        userTask.status = taskStatus
                        
                        try? viewContext.save()
                        
                        taskTitle = ""
                        taskTime = 0
                    }
                }.buttonStyle(.borderedProminent)
            }
            ScrollView{
                VStack{
                    ForEach(tasks, id: \.wrappedID){ task in
                        HStack{
                            Text("\(task.wrappedTitle)")
                                .foregroundColor(.black)
                            Spacer()
                            Text("\(task.wrappedTime)")
                            Button{
                                print("Clique detectado\n")
                                
                                AppDelegate.popover.performClose(nil)
                            } label: {
                                Image(systemName: "hourglass")
                            }
                        }
                    }
                }
            }
        }
            .padding()
        }.frame(idealWidth: 350, maxWidth: 350, idealHeight: 350, maxHeight: 460)
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

