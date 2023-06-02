//
//  PopoverView.swift
//  Macarronada
//
//  Created by vivi on 25/05/23.
//

import SwiftUI

struct PopoverView: View {
   
   
    
    var body: some View {
        ZStack{
            Color.white
            VStack(alignment: .leading){
                VStack{
                    TabBarView()
                    
                    InputBarView()
                   
                    NewTimeView(timeText: "teste chelly")
                    
                    
                }
                
            
            
            }
        }.frame(idealWidth: 700, maxWidth: 1000, idealHeight: 700, maxHeight: 1000)
    }
    
    

}

