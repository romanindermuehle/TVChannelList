//
//  ChannelData.swift
//  TVChannelList
//
//  Created by Roman Indermühle on 15.08.23.
//

import Foundation

class ChannelListViewModel: ObservableObject {
    
    @Published var showFilter = false
    @Published var showingExporter = false
    @Published var showAdChannelsView = false
    
    @Published var item: ChannelList
    
    init(item: ChannelList) {
        self.item = item
        Task {
            await loadData()
        }
    }
    
    @Published var searchText = ""
    
    private struct Constant {
        static let urlChannels = "https://www.swisscom.ch/portal-services/portal-integration/ws/channellist/channel-list/de"
    }
    
    func loadData() async {
        guard let url = URL(string: Constant.urlChannels) else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                
                var newChannels: [Channel] = []
                for (_, value) in decodedResponse.channels {
                    let channel = Channel(title: value.title, logo: modifyLogoString(logoString: value.logo))
                    newChannels.append(channel)
                    print(channel)
                    
                }
                print(decodedResponse)
                let sortedChannels = newChannels.sorted {
                    $0.title.localizedStandardCompare($1.title) == .orderedAscending
                }
                print(newChannels)
                await updateChannels(from: sortedChannels)
                
            }  else {
                print("error")
            }
        } catch {
            print("Invalid data")
        }
    }
    
    @MainActor func updateChannels(from newChannels: [Channel]) {
        SharedStorage.shared.allChannels = newChannels
    }
    
    var filteredChannels: [Channel] {
        if searchText.isEmpty {
            return SharedStorage.shared.notDeletedChannels
            
        } else {
            return SharedStorage.shared.notDeletedChannels.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func deleteChannel(id: UUID) {
        if let index = SharedStorage.shared.allChannels.firstIndex(where: { $0.id == id }) {
            SharedStorage.shared.allChannels[index].isDeleted = true
            print(index)
        }
    }
    
    func moveChannel(from: IndexSet, to: Int) {
        SharedStorage.shared.allChannels.move(fromOffsets: from, toOffset: to)
    }
    
    func modifyLogoString(logoString: String) -> String {
        var modifiedString = logoString
        
        // Replace "{resolution}" with "W90"
        modifiedString = modifiedString.replacingOccurrences(of: "{resolution}", with: "W90")
        
        // Replace "{fileType}" with "png"
        modifiedString = modifiedString.replacingOccurrences(of: "{fileType}", with: "png")
        
        print("modifiedString: \(modifiedString)")
        return modifiedString
    }
}
