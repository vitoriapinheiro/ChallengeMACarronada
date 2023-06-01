//
//  TabBarView.swift
//  Macarronada
//
//  Created by michellyes on 29/05/23.
//

import SwiftUI

struct TabButtonView: View {
    
    var image: String
    var title: String
    @Binding var currentTab: String
    @State private var selectedTab = 0

    
    var action: () -> Void // Closure para ser executado ao clicar no botão
    
    var body: some View{
        
        Button(action: {
                    currentTab = title // Atualiza o valor de currentTab para o título do botão clicado
                    action() // Executa o closure ao clicar no botão
        }, label: {
            
            VStack{
                    HStack{
                        
                        Image(systemName: image)
                            .foregroundColor(currentTab == title ? .appBrown : .appLightBrown)
                            .font(.system(size: 18))
                            .padding(.leading, 20)
                        
                        Text(title)
                            .font(.callout)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(currentTab == title ? .appBrown : .appLightBrown)
                            .padding(.trailing, 65)
                            
                    }
                    
                    Rectangle()
                        .foregroundColor(currentTab == title ? .appBrown : .appGray)
                        .frame(width: 175, height: 3)
            }
            .frame(width: 175, height: 40)
            .background(
                        ZStack{
                            if currentTab == title{
                                Rectangle()
                                    .fill(.white)
                            } else {
                                Rectangle()
                                    .fill(Color.appGray)
                            }
                        }
            )
        })
        .buttonStyle(PlainButtonStyle())
        
        
    }
}
