//
//  MyListsView.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 03.12.23.
//

import SwiftUI
import SwiftData

struct MyListsView: View {

    @Environment(\.modelContext) var context
    @Query var lists: [LocalChannelList]
    @State var showAddSheet: Bool = false

    var body: some View {
        List(lists, id: \.id) { list in
            Text(list.name)
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
            if lists.isEmpty {
                ContentUnavailableView(
                    "No Lists found",
                    systemImage: "radio",
                    description: Text("Create new List with the +")
                )
            }
        }
        .sheet(isPresented: $showAddSheet, content: {
            AddListView()
                .presentationDetents([.height(200.0)])
        })
    }
}

#Preview {
    MyListsView()
}
