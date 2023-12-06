//
//  HomeView.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 03.12.23.
//

import SwiftUI

struct HomeView: View {

    @State var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.localChannels != nil {
                MyListsView(viewModel: .init())
            } else {
                ProgressView() {
                    Text("Loading...")
                }
            }
        }
        .task {
            viewModel.fetchChannels()
        }
    }
}
