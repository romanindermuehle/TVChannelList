//
//  SharedStorage.swift
//  TVChannelList
//
//  Created by Roman Indermühle on 12.10.2023.
//

import Foundation

class SharedStorage: ObservableObject {
    static let shared = SharedStorage()
    
    @Published var allChannels: [Channel] = [] {
        didSet {
            saveChannels()
        }
    }
    var notDeletedChannels: [Channel] {
        allChannels.filter { $0.isDeleted == false }
    }
    var deletedChannels: [Channel] {
        allChannels.filter { $0.isDeleted == true }
    }
    
    func saveChannels() {
        if let encodedData = try? JSONEncoder().encode(allChannels) {
            UserDefaults.standard.setValue(encodedData, forKey: "allChannels")
            print(encodedData)
            print(deletedChannels)
        }
    }
    
    func getChannels() {
        guard let data = UserDefaults.standard.data(forKey: "allChannels"),
              let savedChannels = try? JSONDecoder().decode([Channel].self, from: data)
        else { return }
        self.allChannels = savedChannels
        print(savedChannels)
    }
    
    private init(){
        getChannels()
    }
}
