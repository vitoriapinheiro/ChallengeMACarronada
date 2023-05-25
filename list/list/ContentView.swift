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
                        .listRowBackground(Color.cyan) // Altere a cor de fundo da célula
                        .frame(height: 87)
                        // .padding(.vertical, 5)
                        // .padding(.horizontal, 10)
                        // .cornerRadius(8)
                    }
                   // .frame(width: 375, height: 88)
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

