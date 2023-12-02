//
//  ListDetailView.swift
//  MySwisscom
//
//  Created by Roman Indermühle on 12.05.23.
//

import SwiftUI

struct ChannelListView: View {
    
    @StateObject var viewModel: ChannelListViewModel
    @ObservedObject var sharedStorage = SharedStorage.shared
    
    var body: some View {
        List {
            ForEach(viewModel.filteredChannels, id: \.id) { channel in
                ChannelItem(channel: channel)
                    .swipeActions {
                               Button("Delete") {
                                   viewModel.deleteChannel(id: channel.id)
                                   print("Deleted!")
                               }
                               .tint(.red)
                           }
            }
            .onMove(perform: viewModel.moveChannel)
        }
        .navigationTitle(viewModel.item.name)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        print(SharedStorage.shared.allChannels.count)
                    } label: {
                        Label("Print list", systemImage: "printer")
                    }
                    Button {
                        viewModel.showFilter.toggle()
                        print("Filter button tapped")
                    } label: {
                        Label("Filter list", systemImage: "line.3.horizontal.decrease.circle")
                    }.disabled(true)
                    Button {
                        print("Button tapped")
                    } label: {
                        Label("Edit channels", systemImage: "pencil")
                    }.disabled(true)
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    viewModel.showAdChannelsView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $viewModel.showAdChannelsView) {
            NavigationStack {
                AddNewChannelsView(viewModel: AddNewChannelsViewModel())
            }
        }
        .searchable(text: $viewModel.searchText)
        .onAppear {
            SharedStorage.shared.getChannels()
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let item = ChannelList(name: "Test")
        ChannelListView(viewModel: .init(item: item))
    }
}
