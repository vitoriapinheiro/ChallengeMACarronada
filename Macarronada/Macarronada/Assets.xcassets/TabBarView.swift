//
//  TabBarView.swift
//  Macarronada
//
//  Created by vivi on 01/06/23.
//

import SwiftUI

struct TabBarView: View {
    @State var currentTab = "My tasks"
    @State private var isTasksViewVisible = false
    @State private var isHistoryViewVisible = false
    
    
    var body: some View {
        VStack{
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
            
            Spacer(minLength: 20)
            
            if isTasksViewVisible {
                
                TaskView()
                
            } else if isHistoryViewVisible {
                HistoryView()
                
            }
            
        }
        .padding(.all)
        
    }
}

