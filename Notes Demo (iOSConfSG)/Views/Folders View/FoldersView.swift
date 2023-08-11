//
//  FoldersView.swift
//  Notes Demo (iOSConfSG)
//
//  Created by Don Chia on 3/8/23.
//

import SwiftUI
import SwiftData

struct FoldersView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var presentCreateFolderSheet: Bool = false
    
    @Query(sort: \Folder.lastModified, order: .reverse) private var folders: [Folder]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(folders) { folder in
                    NavigationLink(destination: NotesView(folder: folder), label: {
                        HStack {
                            Image(systemName: "folder")
                            Text(folder.folderName)
                            Spacer()
                            Text(folder.notes.count.description)
                                .foregroundStyle(Color.secondary)
                        }
                    })
                }
                .onDelete(perform: deleteFolder)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        presentCreateFolderSheet.toggle()
                    }, label: {
                        Label("New Folder", systemImage: "folder.badge.plus")
                    })
                })
                
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    EditButton()
                })
            }
            .sheet(isPresented: $presentCreateFolderSheet, content: {
                CreateFolderView(presentSheet: $presentCreateFolderSheet)
            })
            .navigationTitle(Text("Folders"))
        } detail: {
            if folders.isEmpty {
                ContentUnavailableView("No folders created", systemImage: "folder")
            } else {
                folders.first.map { folder in
                    NavigationStack {
                        NotesView(folder: folder)
                    }
                }
            }
        }
    }
    
    private func deleteFolder(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(folders[index])
            }
        }
    }
}

#Preview {
    FoldersView()
        .modelContainer(for: Folder.self, inMemory: true)
}
