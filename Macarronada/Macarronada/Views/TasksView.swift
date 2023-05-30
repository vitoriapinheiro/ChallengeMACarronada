//
//  TasksView.swift
//  Macarronada
//
//  Created by michellyes on 29/05/23.
//

import SwiftUI

struct TasksView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [])
    var tasks: FetchedResults<UserTask>
    
    @State private var taskTitle: String = ""
    @State private var taskTime: Int = 0

    var body: some View {
        
        TextField("Digite aqui", text: $taskTitle)
        HStack{
            Button("Cancelar"){
                NSApplication.shared.terminate(nil)
            }
            Spacer()
            Button("Salvar"){
                if !taskTitle.isEmpty{
                    let userTask = UserTask(context: viewContext)
                    userTask.id = UUID()
                    userTask.title = taskTitle
                    userTask.time = taskTime
                    
                    try? viewContext.save()
                    
                    taskTitle = ""
                    taskTime = 0
                }
            }.buttonStyle(.borderedProminent)
        }
        Divider()
            .padding(.vertical, 4)
        ForEach(tasks, id: \.wrappedID){ task in
            HStack{
                Text("\(task.wrappedTitle)")
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

