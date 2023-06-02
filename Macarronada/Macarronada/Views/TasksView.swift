//
//  TaskView.swift
//  Macarronada
//
//  Created by vivi on 01/06/23.
//

import SwiftUI

struct TaskView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [])
    var tasks: FetchedResults<UserTask>
    
    @State private var taskTitle: String = ""
    @State private var taskTime: Int = 0
    @State private var taskStatus: String = "notStarted"
    
    var body: some View {
        VStack(alignment: .center){
            VStack(alignment: .center){
                TextField("Digite aqui", text: $taskTitle)
                    .foregroundColor(.black)
                    .frame(width: 300)
                HStack{
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
                                    .foregroundColor(.black)
                                Button{
                                    print("Clique detectado\n")
                                    AppDelegate.popover.performClose(nil)
                                } label: {
                                    Image(systemName: "hourglass")
                                        .accentColor(.black)
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                }
            }
        }
        .frame(minWidth: 330, maxWidth: 330)
    }
}
