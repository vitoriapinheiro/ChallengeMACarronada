//
//  TabBarView.swift
//  Macarronada
//
//  Created by vivi on 01/06/23.
//

import SwiftUI

struct TabBarView: View {
    @State var currentTab = "My tasks"
    @State private var isTasksViewVisible = true
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                TabButtonView(image: "checklist", title: "Atividades", currentTab: $currentTab, action: {
                    isTasksViewVisible = true
                })
                
                TabButtonView(image: "clock.fill", title: "Histórico", currentTab: $currentTab, action: {
                    isTasksViewVisible = false
                })
            }
            .padding(.horizontal)
            .padding(.top)
            if isTasksViewVisible {
                TaskView()
            } else {
                HistoryCardView()
            }
        }
        
    }
}

