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
        RealmManager.shared.read(RealmChannelList.self) { [weak self] lists in
            guard let self else { return }
            self.myLists = lists
        }
    }

    func saveList(name: String) {
        let list = RealmChannelList()
        list.name = name

        RealmManager.shared.insert(list) { [weak self] finished in
            guard let self, finished else { return }
            self.fetchMyLists()
        }
    }
}
