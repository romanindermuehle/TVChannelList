//
//  AddNewChannelsViewModel.swift
//  TVChannelList
//
//  Created by Roman Indermühle on 12.10.2023.
//

import Foundation

class AddNewChannelsViewModel: ObservableObject {
    func addChannel(id: UUID) {
        if let index = SharedStorage.shared.allChannels.firstIndex(where: { $0.id == id }) {
            SharedStorage.shared.allChannels[index].isDeleted = false
        }
    }
}
