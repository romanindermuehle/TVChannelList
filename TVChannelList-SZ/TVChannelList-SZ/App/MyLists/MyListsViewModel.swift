//
//  MyListsViewModel.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 06.12.23.
//

import Foundation

@Observable
class MyListsViewModel {

    private(set) var myLists: [RealmChannelList] = []

    init() {
        fetchMyLists()
    }

    private func fetchMyLists() {
        self.myLists = RealmManager.shared.read(RealmChannelList.self)
    }

    func saveList(name: String) {
        let list = RealmChannelList()
        list.name = name
        RealmManager.shared.insert(list)
        fetchMyLists()
    }
}
