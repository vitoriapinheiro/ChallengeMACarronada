//
//  ContentView.swift
//  list
//
//  Created by Danielly Santos Lopes da Silva on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var textInput: String = ""
    @State private var inputList: [String] = []
    
    var body: some View {
        VStack {
            TextField("Digite algo", text: $textInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onSubmit {
                    addItemToList()
                }
            
            
            List(inputList, id: \.self) { input in
                Text(input)
            }
            
            Spacer()
        }
        .padding()
        .padding()
    }
    
    private func addItemToList() {
        guard !textInput.isEmpty else { return }
        inputList.append(textInput)
        textInput = ""
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
