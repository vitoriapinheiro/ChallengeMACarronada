//
//  InputBarView.swift
//  Macarronada
//
//  Created by michellyes on 01/06/23.
//

import SwiftUI
import CoreData

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
                        NewTimeView(timeText: "\(task.wrappedTitle)")
                    }
                }
            }
        }
        .frame(width: 320)
        
        
    }
    
    func updateItem(with uuid: UUID) {
        let fetchRequest: NSFetchRequest<UserTask> = UserTask.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", uuid as CVarArg)
        
        do {
            let results = try viewContext.fetch(fetchRequest)
            if let item = results.first {
                item.status = "inProgress"
                try viewContext.save()
                print("Item updated successfully.")
            }
        } catch {
            print("Failed to update item: \(error)")
        }
    }
}

