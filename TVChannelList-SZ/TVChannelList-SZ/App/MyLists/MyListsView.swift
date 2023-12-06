//
//  MyListsView.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 03.12.23.
//

import Foundation
import SwiftUI

struct MyListsView: View {

    @State var viewModel: MyListsViewModel
    @State var showAddSheet: Bool = false

    var body: some View {
        List(viewModel.myLists, id: \.self) { list in
            NavigationLink(value: list) {
                Text(list.name)
            }
        }
        .navigationTitle("ChanneList")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "plus")
                    .font(.system(size: 22.0, weight: .bold))
                    .foregroundStyle(.cyan)
                    .button {
                        showAddSheet.toggle()
                    }
            }
        }
        .overlay {
            if viewModel.myLists.isEmpty {
                ContentUnavailableView(
                    "No Lists found",
                    systemImage: "radio",
                    description: Text("Create new List with the +")
                )
            }
        }
        .sheet(isPresented: $showAddSheet, content: {
            AddListView(viewModel: viewModel)
                .presentationDetents([.height(200.0)])
        })
        .navigationDestination(for: RealmChannelList.self) { list in
            ListView(viewModel: .init(list: list))
        }
    }
}
