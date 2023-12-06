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
        fetchLocalChannels { [weak self] state in
            guard let self, !state else { return }
            Task {
                let result = await self.channelService.getAll()
                switch result {
                case .success(let channels):
                    self.saveLocalChannels(channels)

                case .failure(let error):
                    print("Error: \(error.message)")
                }
            }
        }
    }

    private func fetchLocalChannels(completion: @escaping (Bool) -> ()) {
        DispatchQueue.main.async {
            guard let local = RealmManager.shared.read(RealmChannels.self).first else {
                completion(false)
                return
            }
            self.localChannels = local
            completion(true)
        }
    }

    private func saveLocalChannels(_ channels: Channels) {
        DispatchQueue.main.async {
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
}
