//
//  TypeWriterView.swift
//  Macarronada
//
//  Created by vivi on 29/05/23.
//

import SwiftUI

struct TypewriterView: View {
    let text: String
    @State private var animatedText: String = ""
    
    var body: some View {
        Text(animatedText)
            .foregroundColor(.black)
            .font(.title)
            .padding()
            .onAppear {
                animateText()
            }
    }
    
    private func animateText() {
        for (index, character) in text.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                animatedText += String(character)
            }
        }
    }
}
