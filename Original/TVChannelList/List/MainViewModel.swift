//
//  ListViewModel.swift
//  MySwisscom
//
//  Created by Roman Indermühle on 19.05.23.
//

import Foundation


class MainViewModel: ObservableObject {
    @Published var showingAddView = false
    
    @Published var items: [ChannelList] = [] {
        didSet {
            saveLists()
        }
    }
    
    init() {
        getLists()
    }
    
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func deleteItem(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func addItem(name: String) {
        let item = ChannelList(name: name)
        items.append(item)
    }
    
    func saveLists() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: "items")
            print(encodedData)
        }
    }
    
    func getLists() {
        guard let data = UserDefaults.standard.data(forKey: "items"),
              let savedItems = try? JSONDecoder().decode([ChannelList].self, from: data)
        else { return }
        self.items = savedItems
        print(savedItems)
    }
}
