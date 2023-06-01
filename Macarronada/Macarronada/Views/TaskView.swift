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
        @State private var textInput: String = ""
        @State private var inputList: [String] = []
        @State private var isTimerViewVisible = false
        var body: some View {
            VStack {
                VStack {
                    TextField("Digite aqui", text: $textInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(.black).background(.gray)
                        .padding()
                        .onSubmit {
                            addItemToList()
                        }
                }
                List(inputList, id: \.self) { input in
                    HStack {
                        TimeView(timeText: input)
                    }
                    // .listRowBackground(Color.cyan) // Altere a cor de fundo da célula
                    .frame(height: 87)
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
    extension NSTableView {
        open override func viewDidMoveToWindow() {
            super.viewDidMoveToWindow()
            backgroundColor = NSColor.clear
            if let esv = enclosingScrollView {
                esv.drawsBackground = false
            }
        }
    }
