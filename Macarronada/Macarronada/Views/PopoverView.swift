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
            
            
            VStack(spacing: 50) {
                HStack {
                    List(inputList, id: \.self) { input in
                        HStack {
                            
                            TempoView(timeText: input)
                        }
                        .listRowBackground(Color.cyan) // Altere a cor de fundo da célula
                        .frame(height: 87)
                        
                    }
                    
                    Spacer()
                    
                }
            }
        }
    
    
    private func addItemToList() {
        if !textInput.isEmpty {
            inputList.append(textInput)
            textInput = ""
            isTimerViewVisible = true
        }
    }
}
