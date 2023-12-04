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
    var channels: Channels?

    func getChannels() {
        Task {
            let result = await channelService.getAll()
            switch result {
            case .success(let channels):
                self.channels = channels

            case .failure(let error):
                print("Error: \(error.message)")
            }
        }
    }
}
