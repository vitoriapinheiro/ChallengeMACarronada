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
    
    @State private var textInput: String = ""
    @State private var inputList: [String] = []
    @State private var isTimerViewVisible = false
    
    var body: some View {
        VStack {
            
            VStack {
                TextField("Digite aqui", text: $textInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onSubmit {
                        addItemToList()
                    }
            }
            
            VStack(spacing: 50) {
                HStack {
                    List(inputList, id: \.self) { input in
                        HStack {
                            Text(input)
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding(10)
                                .cornerRadius(8)
                            
                            TempoView()
                        }
                       // .listRowBackground(Color.cyan) // Altere a cor de fundo da célula
                        .frame(height: 87)
                        
                    }
                    
                }
                .background(Color.white)
                
                .cornerRadius(8)
                
                Spacer()
            }
        }
    }
    
    private func addItemToList() {
        guard !textInput.isEmpty else { return }
        inputList.append(textInput)
        textInput = ""
        isTimerViewVisible = true
        
    }
}



//parte comentada de vivi
    
//    //var body: some View {
//        VStack(alignment: .leading){
//            TextField("Digite aqui", text: $taskTitle)
//            HStack{
//                Button("Cancelar"){
//                    NSApplication.shared.terminate(nil)
//                }
//                Spacer()
//                Button("Salvar"){
//                    if !taskTitle.isEmpty{
//                        let userTask = UserTask(context: viewContext)
//                        userTask.id = UUID()
//                        userTask.title = taskTitle
//                        userTask.time = taskTime
//                        
//                        try? viewContext.save()
//                        
//                        taskTitle = ""
//                        taskTime = 0
//                    }
//                }.buttonStyle(.borderedProminent)
//            }
//            Divider()
//                .padding(.vertical, 4)
//            ForEach(tasks, id: \.wrappedID){ task in
//                HStack{
//                    Text("\(task.wrappedTitle)")
//                    Spacer()
//                    Text("\(task.wrappedTime)")
//                    Button{
//                        print("Clique detectado\n")
//                        
//                        AppDelegate.popover.performClose(nil)
//                    } label: {
//                        Image(systemName: "hourglass")
//                    }
//                }
//            }
//            
//        }
//        .padding()
//    }
//}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}
