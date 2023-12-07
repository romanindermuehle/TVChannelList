//
//  ListViewModel.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import Foundation

@Observable
class ListViewModel {

    private(set) var list: RealmChannelList
    private var localChannels: RealmChannels?
    private(set) var showedChannels: [RealmChannel] = []
    var pickerTag: Int = 0

    init(list: RealmChannelList) {
        self.list = list
        fetchLocalChannels()
    }

    private func fetchLocalChannels() {
        RealmManager.shared.read(RealmChannels.self) { [weak self] realmChannels in
            guard let self, let localChannels = realmChannels.first else { return }
            self.localChannels = localChannels
            self.changePicker()
        }
    }

    func changePicker() {
        guard let localChannels else { return }
        switch pickerTag {
        case 0:
            showedChannels = Array(localChannels.channels)

        case 1:
            showedChannels = Array(localChannels.radioChannels)

        default:
            showedChannels = Array(localChannels.appChannels)
        }
    }
}
