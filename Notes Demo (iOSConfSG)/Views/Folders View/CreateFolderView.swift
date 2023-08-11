//
//  CreateFolderView.swift
//  Notes Demo (iOSConfSG)
//
//  Created by Don Chia on 7/8/23.
//

import SwiftUI
import SwiftData

struct CreateFolderView: View {
    
    @Binding var presentSheet: Bool
    
    @Environment(\.modelContext) private var modelContext
    
    @State var folderName: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Folder Name", text: $folderName)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction, content: {
                    Button("Create", action: createFolder)
                        .disabled(disableButton())
                })
                ToolbarItem(placement: .cancellationAction, content: {
                    Button("Cancel", action: {
                        presentSheet.toggle()
                    })
                })
            }
            .navigationTitle(folderName.isEmpty ? "New Folder" : folderName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func createFolder() {
        withAnimation {
            let newFolder = Folder(lastModified: Date(), folderName: folderName)
            modelContext.insert(newFolder)
            presentSheet.toggle()
        }
    }
}

extension CreateFolderView {
    func disableButton() -> Bool {
        if folderName.isEmpty {
            return true
        } else {
            return false
        }
    }
}

//#Preview {
//    @State var presentSheet: Bool = true
//    CreateFolderView(presentSheet: $presentSheet)
//}
