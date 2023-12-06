//
//  HomeViewModel.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import Foundation

@Observable
class HomeViewModel {
    private let channelService = ChannelService()
    private(set) var localChannels: RealmChannels?

    func fetchChannels() {
        if !fetchLocalChannels() {
            Task {
                let result = await channelService.getAll()
                switch result {
                case .success(let channels):
                    saveLocalChannels(channels)

                case .failure(let error):
                    print("Error: \(error.message)")
                }
            }
        }
    }

    private func fetchLocalChannels() -> Bool {
        guard let local = RealmManager.shared.read(RealmChannels.self).first else { return false }
        self.localChannels = local
        return true
    }

    private func saveLocalChannels(_ channels: Channels) {
        let localChannels = ChannelAdapter.convertObjects(channels.channels)
        let localRadioChannels = ChannelAdapter.convertObjects(channels.radioChannels)
        let localAppChannels = ChannelAdapter.convertObjects(channels.appChannels)

        let realmChannels = RealmChannels()
        localChannels.forEach { realmChannels.channels.append($0) }
        localRadioChannels.forEach { realmChannels.radioChannels.append($0) }
        localAppChannels.forEach { realmChannels.appChannels.append($0) }

        RealmManager.shared.insert(realmChannels)

        self.localChannels = realmChannels
    }
}
