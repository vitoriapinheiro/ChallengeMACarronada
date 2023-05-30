//
//  PopoverView.swift
//  Macarronada
//
//  Created by vivi on 25/05/23.
//

import SwiftUI

struct PopoverView: View {

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
                
                TasksView()
                
            } else if isHistoryViewVisible {
                HistoryView()
                
            }
         
        }
        .padding(.all)
        //.background(.white)
    }
}


extension NSPopover {
    func setContentSize(_ size: CGSize) {
        if let viewController = contentViewController {
            viewController.preferredContentSize = size
        }
    }
}
