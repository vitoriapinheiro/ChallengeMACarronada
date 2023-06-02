//
//  HistoryCardView.swift
//  Macarronada
//
//  Created by vivi on 01/06/23.
//

import SwiftUI

struct HistoryCardView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [])
    var tasks: FetchedResults<UserTask>
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                ForEach(tasks, id: \.wrappedID){ task in
                    HStack{
                        Text("\(task.wrappedTitle)")
                            .foregroundColor(.black)
                            .font(.custom("IBMPlexMono-Medium", size: 16))
                            .padding(.leading, 12)
                            .frame(width: 200)
                        Text("\(task.wrappedTime)")
                            .foregroundColor(.black)
                            .font(.custom("IBMPlexMono-Medium", size: 16))
                            .padding(.trailing, 18)
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 20)
                            .background(Color.appGreen)
                            .cornerRadius(8)
                    }
                    .background(Color.appGray)
                    .cornerRadius(8)
                    .frame(width: 330)
                }
            }.frame(width: 330)
        }
    }
}
