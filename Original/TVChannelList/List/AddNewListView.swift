
//  InputNameView.swift
//  MySwisscom
//
//  Created by Roman Indermühle on 14.05.23.
//

import SwiftUI

struct AddNewListView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: MainViewModel
    @State var textFieldText = ""
    
    var body: some View {
        NavigationView {
            Form {
                //Input name for the new list
                TextField("Enter list name", text: $textFieldText)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        saveButtonPressed()
                    } label: {
                        Text("Save")
                            .fontWeight(.semibold)
                    }.disabled(textFieldText.isEmpty)
                }
                ToolbarItemGroup(placement: .principal) {
                    Text("Create new list")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
    
    func saveButtonPressed() {
        viewModel.addItem(name: textFieldText)
        dismiss()
    }
}

struct AddNewView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewListView(viewModel: MainViewModel())
            .environmentObject(MainViewModel())
    }
}
