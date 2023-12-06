//
//  ListViewModel.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import Foundation

@Observable
class ListViewModel {

    let list: RealmChannelList
    var pickerTag: Int = 0
    var localChannels: RealmChannels?
    var showedChannels: [RealmChannel] = []

    init(list: RealmChannelList) {
        self.list = list
        fetchLocalChannels()
    }

    private func fetchLocalChannels() {
        guard let local = RealmManager.shared.read(RealmChannels.self).first else { return }
        self.localChannels = local
        changePicker()
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
