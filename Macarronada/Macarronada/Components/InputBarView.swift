//
//  InputBarView.swift
//  Macarronada
//
//  Created by michellyes on 01/06/23.
//

import SwiftUI

struct InputBarView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [])
    var tasks: FetchedResults<UserTask>
    
    
    @State private var taskTitle: String = ""
    @State private var taskTime: Int = 0
    @State private var taskStatus: String = "notStarted"
    
    var body: some View {
        VStack{
            
            ZStack{
                Color.appGray
                
                HStack{
                    
                    HStack {
                        Image(systemName: "pencil")
                            .imageScale(.large)
                            .foregroundColor(.appLightBrown)
                            .padding(.leading, 10)
                        TextField("Digite aqui", text: $taskTitle)
                            .foregroundColor(.appBrown)
                            .onSubmit {
                                let userTask = UserTask(context: viewContext)
                                userTask.id = UUID()
                                userTask.title = taskTitle
                                userTask.time = taskTime
                                userTask.status = taskStatus
                                
                                try? viewContext.save()
                                
                                taskTitle = ""
                                taskTime = 0
                            }
                        
                    }
                    .frame(width: 270, height: 40, alignment: .leading)
                    
                    
                    HStack{
                        
                        ZStack{
                            Color.appBrown
                            Image(systemName: "plus")
                                .imageScale(.large)
                                .foregroundColor(.white)
                        }
                        .frame(width: 40, height: 40, alignment: .trailing)
                        .onTapGesture {
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
                        }
                        
                    }
                    
                }
                
            }
            .frame(width: 320, height: 40)
            .cornerRadius(10)
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
        .frame(width: 320)
        
        
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

