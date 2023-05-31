//
//  ContentView.swift
//  Macarronada
//
//  Created by vivi on 23/05/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment (\.managedObjectContext) private var viewContext
    var body: some View {
        VStack{
            HStack{
                VStack{
                    TypewriterView(text: "Descubra o Espresso!")
                    TypewriterView(text: "Nosso Start Boost aumenta sua produtividade com um período de foco inicial antes das atividades. \nMas lembre-se! O histórico é apagado após 24 horas.")
                }
                .frame(width: 250)
                .padding(.trailing, 60)
                VStack{
                    Image("Onboarding")
                }
            }.padding(.bottom, 20)
            
            VStack{
                HStack{
                    Text("Entenda mais sobre a ciência do Start Boost")
                        .foregroundColor(.black)
                    
                    Button(action: {
                        print("ok")
                    }, label: {
                        Text("OK")
                            .frame(width: 138, height: 44, alignment: .center)
                            .background(Color.appBrown)
                    }).buttonStyle(.plain)
                        
                }
            
        }
            .padding(.bottom, 50)
        }
        .background(Color.white)
        .ignoresSafeArea(.all)
        .frame(idealWidth: 680, idealHeight: 518)
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
