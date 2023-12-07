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
    private(set) var isLoading: Bool = false

    func fetchChannels() {
        isLoading = true
        print("Start Loading Local")
        fetchLocalChannels { [weak self] state in
            guard let self, !state else { return }
            print("Locals not exists, Load from Web")
            Task(priority: .utility) {
                let result = await self.channelService.getAll()
                switch result {
                case .success(let channels):
                    print("Save loaded to local")
                    self.saveLocalChannels(channels)

                case .failure(let error):
                    print("Error: \(error.message)")
                }
            }
        }
    }

    private func fetchLocalChannels(onCompletion: @escaping (Bool) -> ()) {
        RealmManager.shared.read(RealmChannels.self) { [weak self] realmChannels in
            guard let self, let localChannels = realmChannels.first else {
                onCompletion(false)
                return
            }
            self.localChannels = localChannels
            onCompletion(true)
        }
    }

    private func saveLocalChannels(_ channels: Channels) {
        let localChannels = ChannelAdapter.convertObjects(channels.channels)
        let localRadioChannels = ChannelAdapter.convertObjects(channels.radioChannels)
        let localAppChannels = ChannelAdapter.convertObjects(channels.appChannels)

        let realmChannels = RealmChannels()
        localChannels.forEach { realmChannels.channels.append($0) }
        localRadioChannels.forEach { realmChannels.radioChannels.append($0) }
        localAppChannels.forEach { realmChannels.appChannels.append($0) }

        RealmManager.shared.insert(realmChannels) { [weak self] finished in
            guard let self, finished else { return }
            self.localChannels = realmChannels
        }
    }
}
