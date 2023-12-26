//
//  ListViewModel.swift
//  TodoList
//
//  Created by Medhat Mebed on 12/26/23.
//

/*
 CRUD FUNCTIONS: -
 
 CREATE
 READ
 UPDATE
 DELETE
 
 */


import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey = "items_lis"
    init() {
       getItems()
    }
    
    func getItems() {
//        let newItems =  [ ItemModel(title: "this is the first title", isCompleted: true),
//            ItemModel(title: "this is the second", isCompleted: false),
//            ItemModel(title: "third", isCompleted: true)
//        ]
        //items.append(contentsOf: newItems)
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = decodedData
        
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel) {
//        if let index = items.firstIndex(where: {$0.id == item.id}) {
//            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
//        }
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
