//
//  AddNewChannelsView.swift
//  TVChannelList
//
//  Created by Roman Indermühle on 11.10.2023.
//

import SwiftUI

struct AddNewChannelsView: View {
    
    @StateObject var viewModel: AddNewChannelsViewModel
    @ObservedObject var sharedStorage = SharedStorage.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            ForEach(sharedStorage.deletedChannels, id: \.id) { channel in
                ChannelItem(channel: channel)
                    .swipeActions {
                               Button("Add") {
                                   viewModel.addChannel(id: channel.id)
                                   print("Added!")
                               }
                               .tint(.green)
                           }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .principal) {
                Text("Add channels")
                    .font(.headline)
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.gray)
                        .opacity(0.5)
                }
            }
        }
    }
}

#Preview {
    AddNewChannelsView(viewModel: AddNewChannelsViewModel())
}

