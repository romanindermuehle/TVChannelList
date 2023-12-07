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

                VStack(spacing: 25.0) {
                    Image(systemName: "sparkles.tv")
                        .font(.system(size: 60.0))
                        .foregroundStyle(.teal)

                    Text("Loading Channels...")
                        .font(.system(size: 20.0, weight: .bold))
                        .foregroundStyle(.gray)
                }
            }
        }
        .task {
            viewModel.fetchChannels()
        }
    }
}
