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
    @State var currentTab = "My tasks"
    @State private var isTasksViewVisible = false
    @State private var isHistoryViewVisible = false
    
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                TabButtonView(image: "checklist", title: "My tasks", currentTab: $currentTab, action: {
                    isTasksViewVisible = true
                    isHistoryViewVisible = false
                })
                
                TabButtonView(image: "clock.fill", title: "History", currentTab: $currentTab, action: {
                    isTasksViewVisible = false
                    isHistoryViewVisible = true
                })
            }
            .padding(.horizontal)
            .padding(.top)
            
            Spacer(minLength: 0)
            
            
            
            if isTasksViewVisible {
            
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
                
            } else if isHistoryViewVisible {
                Text("nada aqui por enquanto...")
            }
            
        }
        .padding()
        //.background(.white)
    }
}

