//
//  ListView.swift
//  MySwisscom
//
//  Created by Roman Indermühle on 14.05.23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.items) { item in
                    NavigationLink(destination: ChannelListView(viewModel: .init(item: item))) {
                            Text(item.name)
                        }
                }
                .onDelete(perform: viewModel.deleteItem)
                .onMove(perform: viewModel.moveItem)
            }
            .navigationTitle("Channel List")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingAddView.toggle()
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .onAppear {
                viewModel.getLists()
            }
            .overlay {
                if viewModel.items.isEmpty {
                    EmptyStateView()
                }
            }
        }
        .sheet(isPresented: $viewModel.showingAddView) {
            AddNewListView(viewModel: viewModel)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
