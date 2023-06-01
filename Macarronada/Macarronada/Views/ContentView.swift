//
//  ContentView.swift
//  Macarronada
//
//  Created by vivi on 23/05/23.
//

import SwiftUI
import CoreData
import AppKit

struct ContentView: View {
    @Environment (\.managedObjectContext) private var viewContext
    var body: some View {
        ZStack{
            Color.white
            VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Descubra o Espresso!")
                        .foregroundColor(.black)
                        .font(.custom("IBMPlexMono-BoldItalic", size: 32))
                        .frame(width: 250, height: 84)
                    TypewriterView(text: "Nosso Start Boost aumenta sua produtividade com um período de foco inicial antes das atividades. \nMas lembre-se! O histórico é apagado após 24 horas.")
                        .frame(width: 250, height: 216, alignment: .leading)
                }
                .padding(.trailing, 60)
                VStack{
                    Image("Onboarding")
                }
            }.padding(.bottom, 20)
            
                VStack{
                    HStack{
                        Button(action: {
                            openLink("https://www.linkedin.com/in/vitoria-pinheiro/")
                        }, label: {
                            Text("Entenda mais sobre a ciência do Start Boost")
                                .foregroundColor(.black)
                                .font(.custom("IBMPlexMono-Bold", size: 14))
                                .frame(width: 265, alignment: .leading)
                        }).buttonStyle(.plain)
                        Spacer()
                        Button(action: {
                            NSApp.keyWindow?.close()
                        }, label: {
                            Text("OK")
                                .foregroundColor(.white)
                                .font(.custom("IBMPlexMono-Bold", size: 18))
                                .frame(width: 138, height: 44, alignment: .center)
                                .background(Color.appBrown)
                                .cornerRadius(4)
                        }).buttonStyle(.plain)
                            
                    }
                    .frame(width: 580)
                }
            .padding(.bottom, 50)
        }
            .padding(50)
        }
        .frame(idealWidth: 680, maxWidth: .infinity, idealHeight: 518, maxHeight: .infinity)
    }
    
    func openLink(_ urlString: String){
        guard let url = URL(string: urlString) else {return}
        NSWorkspace.shared.open(url)
    }
}
    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default
//    )
//
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text ("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text (item.timestamp!, formatter: itemFormatter)
//                        24
//                    }
//                    .onDelete(perform: deleteItems)
//                    .toolbar {
//                        ToolbarItem
//                        Button (action: addItem) {
//                            Label("Add Item", systemImage: "plus")
//                            Text ("Select an item")
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping
//                // application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError ("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map{items[$0]}.forEach(viewContext.delete)
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalerror() causes the application to generate a crash log and terminate. You should not use this function in a shipping
//                // application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError),  \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private let itemFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        formatter.timeStyle = .medium
//
//        return formatter
//    }()
